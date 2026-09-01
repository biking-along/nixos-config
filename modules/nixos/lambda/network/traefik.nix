{
  age.secrets."traefik.env" = {
    file = ../../../../secrets/traefik.env.age;
    mode = "770";
    owner = "traefik";
    group = "traefik";
  };

  services.traefik = {
    enable = true;
    # environmentFiles = ["/run/agenix/traefik.env"];

    staticConfigOptions = {
      # environmentFiles = ["/run/agenix/traefik.env"];
      api.dashboard = true;
      certificatesResolvers."tailscale".tailscale = {};
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
          http.tls.certResolver = "tailscale";
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
          rule = "Host(`authentik.lambda.hawk-coelacanth.ts.net`) || HostRegexp(`{subdomain:[a-z0-9]+}.lambda.hawk-coelacanth.ts.net`) && PathPrefix(`/outpost.goauthentik.io/`)";
          service = "auth";
          tls.certResolver = "tailscale";
        };
        dashboard = {
          entryPoints = ["websecure"];
          rule = "Host(`traefik.lambda.hawk-coelacanth.ts.net`)";
          service = "api@internal";
          tls.certResolver = "letsencrypt";
          middlewares = ["authentik"];
        };
        paperless = {
          entryPoints = ["websecure"];
          rule = "Host(`paperless.rwillia.ms`)";
          service = "paperless";
          tls.certResolver = "tailscale";
          middlewares = ["authentik"];
        };
        immich = {
          entryPoints = ["websecure"];
          rule = "Host(`photos.rwillia.ms`)";
          service = "immich";
          tls.certResolver = "tailscale";
        };
        copyparty = {
          entryPoints = ["websecure"];
          rule = "Host(`nas.rwillia.ms`)";
          service = "copyparty";
          tls.certResolver = "tailscale";
          middlewares = ["authentik"];
        };
        grafana = {
          entryPoints = ["websecure"];
          rule = "Host(`graf.rwillia.ms`)";
          service = "grafana";
          tls.certResolver = "tailscale";
          middlewares = ["authentik"];
        };
      };
    };
  };
}
