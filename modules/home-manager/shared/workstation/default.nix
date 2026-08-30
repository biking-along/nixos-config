{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.homeModules.shared.workstation;
in {
  imports = [
    ./antigravity-cli.nix
    ./automount.nix
    ./foliate.nix
    ./gtk.nix
    ./hideHmDe.nix
    ./imv.nix
    ./mpv.nix
    ./obsidian.nix
    ./vesktop.nix
    ./zathura.nix
  ];
  options.homeModules.shared.workstation.enable = mkOption {
    default = false;
    type = types.bool;
    description = ''
      Enable home-manager workstation specific modules.
    '';
  };
  config = mkIf cfg.enable {
    homeModules.shared.workstation = {
      automount.enable = lib.mkDefault true;
      foliate.enable = lib.mkDefault true;
      gtk.enable = lib.mkDefault true;
      hideHmDe.enable = lib.mkDefault true;
      imv.enable = lib.mkDefault true;
      mpv.enable = lib.mkDefault true;
      obsidian.enable = lib.mkDefault true;
      vesktop.enable = lib.mkDefault true;
      zathura.enable = lib.mkDefault true;
    };
  };
}
