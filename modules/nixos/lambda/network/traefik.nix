{
  age.secrets."traefik.env" = {
    file = ../../../../secrets/traefik.env.age;
    mode = "770";
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
          http.tls = {
            certResolver = "letsencrypt";
          };
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
        technitium-dns = {
          loadBalancer.servers = [
            {
              url = "http://192.168.0.192:53443";
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
        pikvm = {
          loadBalancer = {
            # passHostHeader = true;
            servers = [
              {
                url = "http://192.168.0.222:80";
              }
            ];
          };
        };
      };
      routers = {
        auth = {
          entryPoints = ["websecure"];
          rule = "Host(`authentik.bikingalong.com`) || HostRegexp(`{subdomain:[a-z0-9]+}.bikingalong.com`) && PathPrefix(`/outpost.goauthentik.io/`)";
          service = "auth";
          tls.certResolver = "letsencrypt";
        };
        technitium-dns = {
          entryPoints = ["websecure"];
          rule = "Host(`dns.bikingalong.com`)";
          service = "technitium-dns";
          tls.certResolver = "letsencrypt";
          middlewares = ["authentik"];
        };
        dashboard = {
          entryPoints = ["websecure"];
          rule = "Host(`traefik-lambda.bikingalong.com`)";
          service = "api@internal";
          tls.certResolver = "letsencrypt";
          middlewares = ["authentik"];
        };
        paperless = {
          entryPoints = ["websecure"];
          rule = "Host(`paperless.bikingalong.com`)";
          service = "paperless";
          tls.certResolver = "letsencrypt";
        };
        immich = {
          entryPoints = ["websecure"];
          rule = "Host(`photos.bikingalong.com`)";
          service = "immich";
          tls.certResolver = "letsencrypt";
        };
        copyparty = {
          entryPoints = ["websecure"];
          rule = "Host(`nas.bikingalong.com`)";
          service = "copyparty";
          tls.certResolver = "letsencrypt";
          middlewares = ["authentik"];
        };
        pikvm = {
          entryPoints = ["websecure"];
          rule = "Host(`pikvm.bikingalong.com`)";
          service = "pikvm";
          tls.certResolver = "letsencrypt";
        };
      };
    };
  };
}
