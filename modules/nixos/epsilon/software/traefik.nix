{
  age.secrets."traefikEpsilon.env" = {
    file = ../../../../secrets/traefikEpsilon.env.age;
    mode = "770";
  };
  services.traefik = {
    enable = true;
    environmentFiles = ["/run/agenix/traefikEpsilon.env"];
    staticConfigOptions = {
      api.dashboard = true;
      certificatesResolvers."letsencrypt".acme = {
        email = "bikingalong@pm.me";
        storage = "/var/lib/traefik/acme.json";
        dnsChallenge = {
          provider = "cloudflare";
          resolvers = ["1.1.1.1:53" "9.9.9.9:53"];
          propagation = {
            delayBeforeChecks = "10s";
          };
        };
      };
      entryPoints = {
        web = {
          address = ":80";
          asDefault = true;
          http.redirections.entrypoint = {
            to = "websecure";
            scheme = "https";
          };
        };
        websecure = {
          address = ":443";
          asDefault = true;
          http.tls.certResolver = "letsencrypt";
        };
      };
    };
    dynamicConfigOptions.http = {
      services = {
      };
      routers = {
        dashboard = {
          entryPoints = ["websecure"];
          rule = "Host(`traefik.bikingalong.com`)";
          service = "api@internal";
          tls.certResolver = "letsencrypt";
        };
      };
    };
  };
}
