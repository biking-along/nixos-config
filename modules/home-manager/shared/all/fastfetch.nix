{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.homeModules.shared.all.fastfetch;
in {
  options.homeModules.shared.all.fastfetch.enable = mkOption {
    default = true;
    type = types.bool;
    description = ''
      Enable fastfetch with settings.
    '';
  };
  config = mkIf cfg.enable {
    programs.fastfetch = {
      enable = true;
      settings = {
        logo = {
          type = "small";
          padding = {
            right = 1;
          };
        };
        modules = [
          {
            type = "custom";
            format = "══════════════════════════";
            outputColor = "34";
          }
          {
            type = "os";
            format = "{name} {version}";
          }
          "kernel"
          {
            type = "packages";
            format = "{nix-all} (nix-all)";
          }
          "shell"
          "uptime"
          {
            type = "custom";
            format = "══════════════════════════";
            outputColor = "34";
          }
        ];
      };
    };
  };
}
