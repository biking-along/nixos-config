{
  services.prometheus = {
    enable = true;
    port = 9001;
    listenAddress = "192.168.1.192";
    scrapeConfigs = [
      {
        job_name = "copyparty";
        metrics_path = "/.cpr/metrics";
        tls_config.insecure_skip_verify = true;
        basic_auth = {
          username = "rw";
          password = "?Willow21";
        };
        static_configs = [
          {
            targets = [''nas.rwillia.ms''];
          }
        ];
      }
      {
        job_name = "unpoller";
        static_configs = [
          {
            targets = [''0.0.0.0:9130''];
          }
        ];
      }
    ];
  };
}
