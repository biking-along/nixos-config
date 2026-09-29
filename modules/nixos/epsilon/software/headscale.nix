{
  config,
  pkgs,
  ...
}: {
  age.secrets."headscalePolicy.hujson" = {
    file = ../../../../secrets/headscalePolicy.age;
    mode = "644";
  };
  services = {
    headscale = {
      enable = true;
      address = "0.0.0.0";
      port = 8081;
      settings = {
        server_url = "https://headscale.bikingalong.com";
        trusted_proxies = [
          "127.0.0.1/32"
          "::1/128"
        ];
        policy = {
          mode = "file";
          path = config.age.secrets."headscalePolicy.hujson".path;
        };
        dns = {
          base_domain = "hs.bikingalong.com";
          magic_dns = true;
          nameservers.global = [
            "1.1.1.1"
            "9.9.9.9"
          ];
        };
        derp.server = {
          enabled = true;
          region_id = 999;
          region_code = "headscale";
          region_name = "Headscale Embedded DERP";
          stun_listen_addr = "0.0.0.0:3478";
        };
      };
    };
  };
  environment.systemPackages = with pkgs; [
    headscale
  ];
  networking.firewall.allowedUDPPorts = [3478];
}
