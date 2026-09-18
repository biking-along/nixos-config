{config, ...}: {
  age.secrets = {
    "headplaneCookieSecret" = {
      file = ../../../../secrets/headplaneCookieSecret.age;
      mode = "644";
    };
    "hsApiKey" = {
      file = ../../../../secrets/hsApiKey.age;
      mode = "644";
    };
    "hpOidcClientSecret" = {
      file = ../../../../secrets/hpOidcClientSecret.age;
      mode = "644";
    };
  };

  services.headplane = {
    enable = true;
    settings = {
      headscale = {
        public_url = "https://headscale.bikingalong.com";
        api_key_path = config.age.secrets."hsApiKey".path;
      };
      server = {
        base_url = "https://headscale.bikingalong.com/admin";
        host = "0.0.0.0";
        port = 8082;
        cookie_secret_path = config.age.secrets."headplaneCookieSecret".path;
      };
      oidc = {
        issuer = "https://authentik.bikingalong.com/application/o/headplane/";
        client_id = "pbOTKuTDPWPehAh1qAE6mEnzPhNsz9P8hyJXIGaB";
        client_secret_path = config.age.secrets."hpOidcClientSecret".path;
      };
    };
  };
}
