{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.shared.workstation.hardware.cpuSettings;
  allowedMakes = ["intel" "amd"];
in {
  options.modules.shared.workstation.cpuSettings = {
    enable = mkOption {
      default = false;
      type = types.bool;
      description = ''
        Enable cpu microcode updates and settings.
      '';
    };
    make = mkOption {
      default = "intel";
      type = types.str;
      description = ''
        Choose between Intel and AMD for CPU manufaturer
      '';
    };
  };
  config = mkIf cfg.enable {
    assertions = builtins.elem cfg.make allowedMakes;
    import = ./${cfg.make}.nix;
    powerManagement.cpuFreqGovernor = "performance";
    hardware.cpu.x86.msr = {
      enable = true;
      settings.allow-writes = "on";
    };
  };
}
