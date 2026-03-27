{
  age.secrets."grafanaSecret" = {
    file = ../../../../secrets/grafanaSecret.age;
    mode = "770";
  };
  services.grafana = {
    enable = true;
    settings = {
      server = {
        protocol = "http";
        http_addr = "192.168.1.192";
        http_port = 8081;
        domain = "graf.rwillia.ms";
        enforce_domain = false;
        root_url = "https://graf.rwillia.ms";
        enable_gzip = false;
      };
      security = {
        secret_key = "X4dD1AKvXtWTpI";
        cookie_secure = true;
        allow_embedding = true;
        csrf_trusted_origins = [
          "http://localhost:9001"
          "http://192.168.1.205"
        ];
      };
    };
  };
}
