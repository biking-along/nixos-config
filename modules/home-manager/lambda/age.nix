{
  age = {
    identityPaths = ["/home/rw/.ssh/id_ed25519"];
    secrets = {
      traefikEnv = {
        file = ../../../secrets/traefik.env.age;
      };
    };
  };
}
