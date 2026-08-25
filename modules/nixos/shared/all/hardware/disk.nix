{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.shared.all.hardware.disk;
in {
  options = {
    modules.shared.all.hardware.disk = {
      enable = mkOption {
        default = true;
        type = types.bool;
        description = ''
          Enable universal disk settings.
        '';
      };
    };
  };
  config = mkIf cfg.enable {
    services.fstrim.enable = true;
    boot.tmp = {
      cleanOnBoot = true;
      tmpfsSize = "100%";
      tmpfsHugeMemoryPages = "within_size";
      useTmpfs = false;
    };
  };
}
