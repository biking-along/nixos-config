{
  services.sabnzbd = {
    enable = true;
    user = "rw";
    openFirewall = true;
    allowConfigWrite = true;
    settings = {
      misc = {
        host = "192.168.1.192";
        port = "25566";
      };
    };
  };
}
