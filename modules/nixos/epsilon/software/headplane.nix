{
  services.headplane = {
    enable = true;
    settings = {
      headscale.url = "https://headscale.bikingalong.com";
      server = "0.0.0.0";
      port = "8082";
      proxy_auth = {
        trusted_proxy_cidrs = [
          "127.0.0.1/32"
          "::1/128"
        ];
      };
    };
  };
}
