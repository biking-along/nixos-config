{
  networking = {
    fqdn = "rwilliams.info";
    fqdnOrHostName = "rwilliams.info";
    networkmanager.enable = true;
    hosts = {
      "127.0.0.1" = ["localhost"];
      # "127.0.1.1" = ["rwilliams.info"];
      "::1" = ["localhost"];
    };
    extraHosts = ''
      192.168.0.192 lambda
    '';
  };
  services = {
    sshd.enable = true;
    openssh.enable = true;
  };
  networking.firewall.allowedTCPPorts = [
    22
    80
    443
    2283
    3291
    3923
    6789
    9000
  ];
  networking.firewall.allowedUDPPorts = [
    22
    80
    443
    2283
    3921
    3923
    6789
    9000
  ];
}
