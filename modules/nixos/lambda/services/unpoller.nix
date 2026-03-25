{
  services.unpoller = {
    enable = true;
    prometheus.disable = true;
    unifi = {
      defaults = {
        url = "https://192.168.1.1";
        verify_ssl = false;
        user = "rw";
        pass = "/etc/unifiPass";
        save_sites = true;
        save_ids = true;
      };
    };
    influxdb = {
      url = "http://192.168.1.205:8086";
      db = "unifi-poller";
      user = "unifi-poller";
      pass = "/etc/unifiPass";
      verify_ssl = false;
    };
  };

  services.prometheus.exporters.unpoller = {
    enable = true;
    controllers = [
      {
        url = "https://192.168.1.1";
        verify_ssl = false;
        user = "rw";
        pass = "/etc/unifiPass";
        save_sites = true;
        save_ids = true;
        save_events = true;
        save_alarms = true;
        save_anomalies = true;
        save_dpi = true;
      }
    ];
  };
}
