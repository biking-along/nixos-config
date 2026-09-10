{config, ...}: {
  services = {
    headscale = {
      enable = true;
      address = "127.0.0.1";
      port = 8081;
      settings = {
        server_url = "headscale.bikingalong.com";
        trusted_proxies = [
          "127.0.0.1/32"
          "::1/128"
        ];
        dns_config = {
          base_domain = "bikingalong.com";
          magic_dns = true;
          nameservers = [
            "1.1.1.1"
            "9.9.9.9"
          ];
        };
        derp.server = {
          enabled = true;
          region_id = 999;
          region_code = "headscale";
          region_name = "Headscale Embedded DERP";
          stun_listen_addr = "127.0.0.1:3478";
        };
      };
    };
  };
  environment.systemPackages = [
    config.services.headscale.package
  ];
  networking.firewall.allowedUDPPorts = [3478];
}
