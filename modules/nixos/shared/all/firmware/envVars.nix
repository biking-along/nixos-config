{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.shared.all.firmware.envVars;
in {
  options = {
    modules.shared.all.firmware.envVars = {
      enable = mkOption {
        default = true;
        type = types.bool;
        description = ''
          Set universal environment variables.
        '';
      };
    };
  };
  config = mkIf cfg.enable {
    environment.sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };
}
