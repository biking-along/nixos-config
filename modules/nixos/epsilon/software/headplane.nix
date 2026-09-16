{
  services.headplane = {
    enable = true;
    settings = {
      headscale.public_url = "https://headscale.bikingalong.com";
      server = {
        base_url = "https://headplane.bikingalong.com";
        host = "0.0.0.0";
        port = "8082";
      };
    };
  };
}
