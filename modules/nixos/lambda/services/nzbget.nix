{
  services.nzbget = {
    enable = true;
    user = "nzbget";
    group = "nzbget";
    settings = {
      MainDir = "/mnt/raid0/copyparty/Usenet";
      ControlIP = "127.0.0.1";
      ControlPort = "6789";
    };
  };
}
