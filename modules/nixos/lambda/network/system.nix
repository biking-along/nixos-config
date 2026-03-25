{
  networking = {
    networkmanager.enable = true;
    hosts = {
      "127.0.0.1" = ["lambda"];
      "::1" = ["localhost"];
      "192.168.1.205" = ["homeassistant"];
      "192.168.1.162" = ["gamma"];
      "192.168.1.226" = ["pikvm"];
      "192.168.1.53" = ["gregor"];
    };
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
