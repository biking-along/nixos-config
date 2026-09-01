{
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  cfg = config.homeModules.shared.workstation.antigravity-cli;
in {
  options.homeModules.shared.workstation.antigravity-cli.enable = mkOption {
    default = false;
    type = types.bool;
    description = ''
      Enable antigravity-cli and export gemini api key to home session variable via agenix.
    '';
  };
  config = mkIf cfg.enable {
    age = {
      identityPaths = ["/home/rw/.ssh/id_ed25519"];
      secrets = {
        geminiApiKey = {
          file = ../../../../secrets/geminiApiKey.age;
        };
      };
    };
    home.sessionVariables = {
      GEMINI_API_KEY = "$(${pkgs.coreutils}/bin/cat ${config.age.secrets.geminiApiKey.path})";
    };
    programs.antigravity-cli = {
      enable = true;
      settings = {
        modelProvider = "gemini";
      };
    };
  };
}
