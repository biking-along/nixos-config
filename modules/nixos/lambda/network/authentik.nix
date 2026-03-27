{
  services = {
    authentik = {
      enable = true;
      environmentFile = "/run/agenix/authentik.env";
      settings = {
        email = {
          host = "smtp.protonmail.ch";
          port = 587;
          username = "authentik@rwillia.ms";
          use_tls = true;
          use_ssl = false;
          from = "authentik@rwillia.ms";
        };
        disable_startup_analytics = true;
        avatars = "initials";
      };
    };
  };
}
