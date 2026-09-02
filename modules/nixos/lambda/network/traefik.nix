{
  age.secrets."traefik.env" = {
    file = ../../../../secrets/traefik.env.age;
    mode = "770";
    # owner = "traefik";
    # group = "traefik";
  };
  services.traefik = {
    enable = true;
    environmentFiles = ["/run/agenix/traefik.env"];

    staticConfigOptions = {
      environmentFiles = ["/run/agenix/traefik.env"];
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
        paperless = {
          loadBalancer.servers = [
            {
              url = "http://192.168.0.192:28981";
            }
          ];
        };
        immich = {
          loadBalancer.servers = [
            {
              url = "http://192.168.0.192:2283";
            }
          ];
        };
        copyparty = {
          loadBalancer.servers = [
            {
              url = "http://192.168.0.192:3923";
            }
          ];
        };
        grafana = {
          loadBalancer.servers = [
            {
              url = "http://192.168.0.192:8081";
            }
          ];
        };
      };
      routers = {
        auth = {
          entryPoints = ["websecure"];
          rule = "Host(`authentik.rwilliams.info`) || HostRegexp(`{subdomain:[a-z0-9]+}.rwilliams.info`) && PathPrefix(`/outpost.goauthentik.io/`)";
          service = "auth";
          tls.certResolver = "letsencrypt";
        };
        dashboard = {
          entryPoints = ["websecure"];
          rule = "Host(`traefik.rwilliams.info`)";
          service = "api@internal";
          tls.certResolver = "letsencrypt";
          middlewares = ["authentik"];
        };
        paperless = {
          entryPoints = ["websecure"];
          rule = "Host(`paperless.rwilliams.info`)";
          service = "paperless";
          tls.certResolver = "letsencrypt";
          middlewares = ["authentik"];
        };
        # immich = {
        #   entryPoints = ["websecure"];
        #   rule = "Host(`photos.lambda.hawk-coelacanth.ts.net`)";
        #   service = "immich";
        #   tls.certResolver = "tailscale";
        # };
        copyparty = {
          entryPoints = ["websecure"];
          rule = "Host(`nas.rwilliams.info`)";
          service = "copyparty";
          tls.certResolver = "tailscale";
          middlewares = ["authentik"];
        };
        # grafana = {
        #   entryPoints = ["websecure"];
        #   rule = "Host(`graf.lambda.hawk-coelacanth.ts.net`)";
        #   service = "grafana";
        #   tls.certResolver = "tailscale";
        #   middlewares = ["authentik"];
        # };
      };
    };
  };
}
