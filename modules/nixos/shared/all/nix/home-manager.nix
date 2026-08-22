{
  username,
  state,
  inputs,
  host,
  ...
}: {
  import = inputs.home-manager.nixosModules.home-manager;
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
  };
  home-manager.extraSpecialArgs = {inherit inputs username state host;};
  home-manager.users.${username} = {pkgs, ...}: {
    imports = [
      ../../../../home-manager/${host}/default.nix
      ../../../../home-manager/shared/default.nix
      ../../../../home-manager/shared/workstation/default.nix
      inputs.dms.homeModules.dank-material-shell
      inputs.dms.homeModules.niri
      inputs.danksearch.homeModules.dsearch
      inputs.nix-monitor.homeManagerModules.default
      inputs.agenix.homeManagerModules.default
    ];
    programs.retroarch = {
      enable = true;
      cores = {
        snes9x.enable = true;
        mupen64plus.enable = true;
        mgba.enable = true;
        mesen.enable = true;
        sameboy.enable = true;
        dolphin.enable = true;
        beetle-psx.enable = true;
        pcsx2.enable = true;
        ppsspp.enable = true;
      };
      settings = {
        config_save_on_exit = "true";
        cheevos_enable = "false";
      };
    };
  };
}
