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
        url = "http://127.0.0.1:8081";
        public_url = "https://headscale.bikingalong.com";
        api_key_path = config.age.secrets."hsApiKey".path;
        config_path = "/etc/headscale/config.yaml";
        config_strict = true;
      };
      integration = {
        agent = {
          enabled = true;
        };
        proc.enabled = true;
      };
      server = {
        base_url = "https://headscale.bikingalong.com";
        host = "127.0.0.1";
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
