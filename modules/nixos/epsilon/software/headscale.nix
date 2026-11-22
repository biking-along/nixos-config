{
  config,
  pkgs,
  ...
}: {
  age.secrets."headscalePolicy.hujson" = {
    file = ../../../../secrets/headscalePolicy.age;
    mode = "644";
  };
  age.secrets."hsCloudflareAPI" = {
    file = ../../../../secrets/hsCloudflareAPI.age;
    owner = config.services.headscale.user;
    group = config.services.headscale.group;
    mode = "0400";
  };
  services = {
    headscale = {
      enable = true;
      listen_addr = "0.0.0.0:8081";
      metrics_listen_addr = "0.0.0.0:9090";

      settings = {
        server_url = "https://headscale.bikingalong.com";
        trusted_proxies = [
          "127.0.0.1/32"
          "::1/128"
        ];
        tls_cert_path = "";
        tls_key_path = "";
        policy = {
          mode = "database";
        };
        dns = {
          base_domain = "bikingalong.com";
          certificates = {
            enabled = true;
            zone = "bikingalong.com";
          };
          challenge = {
            resolvers = [
              "1.1.1.1"
              "9.9.9.9"
            ];
            provider = {
              name = "cloudflare";
              api_token = "file:${config.age.secrets.hsCloudflareAPI.path}";
            };
          };
          magic_dns = true;
          override_local_dns = false;
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
          ipv4 = "66.23.198.149";
        };
      };
    };
  };
  environment.systemPackages = with pkgs; [
    headscale
  ];
  networking.firewall.allowedUDPPorts = [3478];
}
