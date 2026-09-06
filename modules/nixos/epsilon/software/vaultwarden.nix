{
  age.secrets."vaultwarden.env" = {
    file = ../../../../secrets/vaultwarden.env.age;
    mode = "770";
  };
  services.vaultwarden = {
    enable = true;
    environmentFile = "/run/agenix/vaultwarden.env";
    domain = "vaultwarden.bikingalong.com";
    config = {
      ROCKET_ADDRESS = "127.0.0.1";
      ROCKET_PORT = "8222";
    };
  };
}
