{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.homeModules.shared.all.shell;
in {
  options.homeModules.shared.all.shell.enable = mkOption {
    default = true;
    type = types.bool;
    description = ''
      Enable home shell settings for all shells.
    '';
  };
  config = mkIf cfg.enable {
    home.shell.enableShellIntegration = true;
    home.shellAliases = {
      nv = "nvim";
      ls = "eza";
      cat = "bat";
      man = "batman";
      gg = "lazygit";
      lambda-dav = "rclone mount --no-check-certificate --vfs-cache-mode writes --dir-cache-time 5s lambda-dav: /home/rw/Network/lambda/";
      cdn = "cd /home/rw/NixOS/nixos-config/";
      wolgamma = "wakeonlan -i 192.168.0.255 d8:43:ae:29:fe:d2";
      nixbld-kappa = "cdn && NIX_BUILD_CORES=16 nix build .#nixosConfigurations.kappa.config.system.build.toplevel -L";
      nixsend-kappa = "cdn && nix copy --to 'ssh://rw@kappa' ./result";
    };
  };
}
