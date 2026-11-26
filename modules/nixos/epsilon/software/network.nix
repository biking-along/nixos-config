{
  networking = {
    fqdn = "bikingalong.com";
    fqdnOrHostName = "bikingalong.com";
    useDHCP = false;
    dhcpcd.enable = false;
    networkmanager.enable = false;
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
      matchConfig.Name = "ens18";
      networkConfig = {
        DHCP = "no";
        IPv6AcceptRA = false;
      };
      address = [
        "104.204.64.67/23"
        "104.204.64.68/23"
        "2606:a8c0:1800:1::40/64"
      ];
      routes = [
        {Gateway = "104.204.64.1";}
        {Gateway = "2606:a8c0:1800::1";}
      ];
      dns = [
        "1.1.1.1"
        "9.9.9.9"
        "2606:4700:4700::1111"
        "2620:fe::fe"
      ];
      linkConfig.RequiredForOnline = "routable";
    };
  };
  services.resolved.enable = true;
  programs.ssh.startAgent = true;
}
