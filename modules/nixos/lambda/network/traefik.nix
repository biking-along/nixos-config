{...}: {
  age.secrets."traefik.env" = {
    file = ../../../../secrets/traefik.env.age;
    mode = "770";
    owner = "traefik";
    group = "traefik";
  };

  services.traefik = {
    enable = true;
    environmentFiles = ["/run/agenix/traefik.env"];

    staticConfigOptions = {
      environmentFiles = ["/run/agenix/traefik.env"];
      api.dashboard = true;
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

      # ...
    };
    dynamicConfigOptions.http = {
      middlewares = {
        authentik = {
          forwardAuth = {
            tls.insecureSkipVerify = true;
            address = "http://localhost:9000/outpost.goauthentik.io/auth/traefik";
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
              url = "http://localhost:9000";
            }
          ];
        };
        hass = {
          loadBalancer.servers = [
            {
              url = "http://192.168.1.205:8123";
            }
          ];
        };
        immich = {
          loadBalancer.servers = [
            {
              url = "http://192.168.1.192:2283";
            }
          ];
        };
        copyparty = {
          loadBalancer.servers = [
            {
              url = "http://192.168.1.192:3923";
            }
          ];
        };
        grafana = {
          loadBalancer.servers = [
            {
              url = "http://192.168.1.192:8081";
            }
          ];
        };
      };
      routers = {
        auth = {
          entryPoints = ["websecure"];
          rule = "Host(`authentik.rwillia.ms`) || HostRegexp(`{subdomain:[a-z0-9]+}.rwillia.ms`) && PathPrefix(`/outpost.goauthentik.io/`)";
          service = "auth";
          tls.certResolver = "letsencrypt";
        };
        dashboard = {
          entryPoints = ["websecure"];
          rule = "Host(`traefik.rwillia.ms`)";
          service = "api@internal";
          tls.certResolver = "letsencrypt";
          middlewares = ["authentik"];
        };
        hass = {
          entryPoints = ["websecure"];
          rule = "Host(`home.rwillia.ms`)";
          service = "hass";
          tls.certResolver = "letsencrypt";
        };
        immich = {
          entryPoints = ["websecure"];
          rule = "Host(`photos.rwillia.ms`)";
          service = "immich";
          tls.certResolver = "letsencrypt";
        };
        copyparty = {
          entryPoints = ["websecure"];
          rule = "Host(`nas.rwillia.ms`)";
          service = "copyparty";
          tls.certResolver = "letsencrypt";
        };
        grafana = {
          entryPoints = ["websecure"];
          rule = "Host(`graf.rwillia.ms`)";
          service = "grafana";
          tls.certResolver = "letsencrypt";
          middlewares = ["authentik"];
        };
      };
    };
  };
}
