{config, ...}: {
  age = {
    identityPaths = ["/home/rw/.ssh/id_ed25519"];
    secrets = {
      geminiApiKey = {
        file = ../../../../secrets/geminiApiKey.age;
      };
    };
  };
  home.sessionVariables = {
    GEMINI_API_KEY = "(cat ${config.age.secrets.geminiApiKey.path})";
  };
  programs.antigravity-cli = {
    enable = true;
  };
}
