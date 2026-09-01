{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.homeModules.shared.workstation.foliate;
in {
  options.homeModules.shared.workstation.foliate.enable = mkOption {
    default = false;
    type = types.bool;
    description = ''
      Enable ebook reader program.
    '';
  };
  config = mkIf cfg.enable {
    programs.foliate = {
      enable = true;
    };
  };
}
