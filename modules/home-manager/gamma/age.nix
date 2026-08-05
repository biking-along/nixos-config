{
  age = {
    identityPaths = ["/home/rw/.ssh/id_ed25519"];
    secrets = {
      ryan01EmailPass = {
        file = ../../../secrets/ryan01EmailPass.age;
      };
    };
  };
}
