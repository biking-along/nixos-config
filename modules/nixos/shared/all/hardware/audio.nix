{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.shared.all.hardware.audio;
in {
  options = {
    modules.shared.all.hardware.audio = {
      enable = mkOption {
        default = true;
        type = types.bool;
        description = ''
          Enable universal audio settings.
        '';
      };
    };
  };
  config = mkIf cfg.enable {
    security.rtkit.enable = true;
    services.pulseaudio.enable = false;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
}
