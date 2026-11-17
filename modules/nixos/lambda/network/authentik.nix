{
  age.secrets."authentik.env" = {
    file = ../../../../secrets/authentik.env.age;
    mode = "770";
  };
  services = {
    authentik = {
      enable = true;
      environmentFile = "/run/agenix/authentik.env";
      settings = {
        listen.trusted_proxy_cidrs = [
          "127.0.0.0/8"
          "::1/128"
          "100.64.0.0/10"
          "192.168.0.0/16"
        ];
        disable_startup_analytics = true;
        avatars = "gravatar";
      };
    };
  };
}
