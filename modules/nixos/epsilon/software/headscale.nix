{
  inputs,
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
      package = inputs.headscale.packages.${pkgs.stdenv.hostPlatform.system}.default;
      settings = {
        server_url = "https://headscale.bikingalong.com";
        listen_addr = "127.0.0.1:8081";
        metrics_listen_addr = "127.0.0.1:9090";
        noise.private_key_path = "/var/lib/headscale/noise_private.key";
        trusted_proxies = [
          "127.0.0.1/32"
          "::1/128"
        ];
        policy = {
          mode = "database";
        };
        database = {
          type = "sqlite";
          sqlite.path = "/var/lib/headscale/db.sqlite";
        };
        dns = {
          base_domain = "hs.bikingalong.com";
          certificates = {
            enabled = true;
            zone = "bikingalong.com";
          };
          challenge = {
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
        taildrop.enabled = true;
        auto_update.enabled = true;
      };
    };
  };
  environment.systemPackages = with pkgs; [
    headscale
  ];
  networking.firewall.allowedUDPPorts = [3478];
}
