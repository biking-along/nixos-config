{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.shared.all.firmware.locale;
in {
  options = {
    modules.shared.all.firmware.locale = {
      enable = mkOption {
        default = true;
        type = types.bool;
        description = ''
          Set universal locale settings.
        '';
      };
    };
  };
  config = mkIf cfg.enable {
    time.timeZone = "America/Chicago";
    i18n.defaultLocale = "en_US.UTF-8";
    i18n.extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };
}
