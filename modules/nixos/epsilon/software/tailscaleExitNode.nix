{
  lib,
  config,
  pkgs,
  ...
}: {
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
        ${pkgs.ethtool}/bin/ethtool -K ens18 rx-udp-gro-forwarding on rx-gro-list off
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
    firewall.checkReversePath = "loose";
    nftables.enable = true;
    firewall = {
      enable = true;
      trustedInterfaces = [config.services.tailscale.interfaceName];
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
