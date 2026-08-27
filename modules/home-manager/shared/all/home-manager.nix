{
  lib,
  config,
  username,
  state,
  ...
}:
with lib; let
  cfg = config.homeModules.shared.all.home-manager;
in {
  options.homeModules.shared.all.home-manager.enable = mkOption {
    default = true;
    type = types.bool;
    description = ''
      Enable home-manager with settings.
    '';
  };
  config = mkIf cfg.enable {
    home = {
      username = "${username}";
      homeDirectory = "/home/${username}";
      stateVersion = "${state}";
    };
    programs.home-manager.enable = true;
  };
}
