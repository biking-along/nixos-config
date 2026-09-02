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
    81
    443
    2283
    3923
    3291
    8080
    8081
    9000
    9130
  ];
  networking.firewall.allowedUDPPorts = [
    22
    80
    81
    443
    2283
    3923
    3921
    8080
    8081
    9000
    9130
  ];
}
