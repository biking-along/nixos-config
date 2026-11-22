{
  lib,
  config,
  pkgs,
  ...
}: {
  environment.etc."99-tailscale.conf" = {
    enable = true;
    target = "/etc/sysctl.d/99-tailscale.conf";
    text = ''
      net.ipv4.ip_forward = 1
      net.ipv6.conf.all.forwarding = 1
    '';
  };
  boot.kernel.sysctl = {
    "net.ipv4.ip_forward" = 1;
    "net.ipv6.conf.all.forwarding" = 1;
  };
  environment.systemPackages = with pkgs; [
    ethtool
  ];
  services.networkd-dispatcher = {
    enable = true;
    rules."50-tailscale-optimizations" = {
      onState = ["routable"];
      script = ''
        ${pkgs.ethtool}/bin/ethtool -K enp3s0 rx-udp-gro-forwarding on rx-gro-list off
      '';
    };
  };
  services.tailscale = {
    extraSetFlags = [
      "--advertise-exit-node"
    ];
    useRoutingFeatures = lib.mkForce "both";
  };
  networking = {
    useNetworkd = true;
    firewall.checkReversePath = "loose";
    nftables.enable = true;
    firewall = {
      enable = true;
      # Always allow traffic from your Tailscale network
      trustedInterfaces = [config.services.tailscale.interfaceName];
      # Allow the Tailscale UDP port through the firewall
      allowedUDPPorts = [config.services.tailscale.port];
    };
  };
  systemd = {
    services.tailscaled.serviceConfig.Environment = [
      "TS_DEBUG_FIREWALL_MODE=nftables"
    ];
    network.wait-online.enable = false;
  };
  boot.initrd.systemd.network.wait-online.enable = false;
}
