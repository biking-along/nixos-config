{lib, ...}: {
  environment.etc."99-tailscale.conf" = {
    enable = true;
    target = "/etc/sysctl.d/99-tailscale.conf";
    text = ''
      net.ipv4.ip_forward = 1
      net.ipv6.conf.all.forwarding = 1
    '';
  };
  services.tailscale = {
    extraSetFlags = [
      "--advertise-routes=192.168.0.0/24"
    ];
    useRoutingFeatures = lib.mkForce "server";
  };
}
