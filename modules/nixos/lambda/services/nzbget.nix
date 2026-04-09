{
  services.nzbget = {
    enable = true;
    user = "nzbget";
    group = "nzbget";
    settings = {
      MainDir = "/mnt/raid0/copyparty/Usenet";
      ControlIP = "192.168.1.192";
      ControlPort = "6789";
    };
  };
}
