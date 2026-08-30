{
  age = {
    identityPaths = ["/home/rw/.ssh/id_ed25519"];
    secrets = {
      geminiApiKey = {
        file = ../../../../secrets/geminiApiKey.age;
      };
    };
  };
  programs.antigravity-cli = {
    enable = true;
  };
}
