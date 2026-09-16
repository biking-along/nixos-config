{config, ...}: {
  age.secrets."headplaneCookieSecret" = {
    file = ../../../../secrets/headplaneCookieSecret.age;
    mode = "644";
  };
  services.headplane = {
    enable = true;
    settings = {
      headscale.public_url = "https://headscale.bikingalong.com";
      server = {
        base_url = "https://headplane.bikingalong.com";
        host = "0.0.0.0";
        port = 8082;
        cookie_secret_path = config.age.secrets."headplaneCookieSecret".path;
      };
    };
  };
}
