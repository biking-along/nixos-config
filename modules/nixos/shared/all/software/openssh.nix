{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.shared.all.software.openssh;
in {
  options = {
    modules.shared.all.software.openssh = {
      enable = mkOption {
        default = true;
        type = types.bool;
        description = ''
          Enable universal openssh settings.
        '';
      };
    };
  };
  config = mkIf cfg.enable {
    services.openssh = {
      enable = true;
      openFirewall = true;
      settings = {
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
        AcceptEnv = [
          "COLORTERM"
          "TERM_PROGRAM"
          "TERM_PROGRAM_VERSION"
        ];
      };
    };
  };
}
