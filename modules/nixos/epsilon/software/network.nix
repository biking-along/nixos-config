{
  networking = {
    fqdn = "bikingalong.com";
    fqdnOrHostName = "bikingalong.com";
    firewall = {
      allowedTCPPorts = [
        80
        443
      ];
      allowedUDPPorts = [
        546
        547
      ];
    };
  };
  systemd.network = {
    enable = true;
    networks."10-wan" = {
      matchConfig.Name = "enp3s0";
      networkConfig = {
        DHCP = false;
        IPv6AcceptRA = false;
      };
      address = [
        "66.23.198.149/24"
        "2606:a8c0:100::3/128"
      ];

      routes = [
        {Gateway = "66.23.198.1";}
        {
          Gateway = "2606:a8c0:100::1";
          # GatewayOnLink = true;
          # PreferredSource = "2606:a8c0:101:2::a";
        }
      ];
    };
  };
  programs.ssh.startAgent = true;
}
