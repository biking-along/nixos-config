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
      middlewares = {
        authentik = {
          forwardAuth = {
            tls.insecureSkipVerify = true;
            address = "http://100.64.0.1:9000/outpost.goauthentik.io/auth/traefik";
            trustForwardHeader = true;
            authResponseHeaders = [
              "X-authentik-username"
              "X-authentik-groups"
              "X-authentik-email"
              "X-authentik-name"
              "X-authentik-uid"
              "X-authentik-jwt"
              "X-authentik-meta-jwks"
              "X-authentik-meta-outpost"
              "X-authentik-meta-provider"
              "X-authentik-meta-app"
              "X-authentik-meta-version"
            ];
          };
        };
      };
      services = {
        auth = {
          loadBalancer.servers = [
            {
              url = "http://100.64.0.1:9000";
            }
          ];
        };
        headscale = {
          loadBalancer.servers = [
            {
              url = "http://0.0.0.0:8081";
            }
          ];
        };
        vaultwarden = {
          loadBalancer.servers = [
            {
              url = "http://127.0.0.1:8222";
            }
          ];
        };
      };
      routers = {
        dashboard = {
          entryPoints = ["websecure"];
          rule = "Host(`traefik.bikingalong.com`)";
          service = "api@internal";
          tls.certResolver = "letsencrypt";
          middlewares = ["authentik"];
        };
        auth = {
          entryPoints = ["websecure"];
          rule = "Host(`authentik.bikingalong.com`) || HostRegexp(`{subdomain:[a-z0-9]+}.bikingalong.com`) && PathPrefix(`/outpost.goauthentik.io/`)";
          service = "auth";
          tls.certResolver = "letsencrypt";
        };
        headscale = {
          entryPoints = ["websecure"];
          rule = "Host(`headscale.bikingalong.com`)";
          service = "headscale";
          tls.certResolver = "letsencrypt";
        };
        vaultwarden = {
          entryPoints = ["websecure"];
          rule = "Host(`vaultwarden.bikingalong.com`)";
          service = "vaultwarden";
          tls.certResolver = "letsencrypt";
        };
      };
    };
  };
}
