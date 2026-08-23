{
  programs.fish = {
    enable = true;
    interactiveShellInit = "fastfetch";
    shellAliases = {
      nv = "nvim";
      ls = "eza";
      cat = "bat";
      man = "batman";
      gg = "lazygit";
      lambda-dav = "rclone mount --no-check-certificate --vfs-cache-mode writes --dir-cache-time 5s lambda-dav: /home/rw/Network/lambda/";
      cdn = "cd /home/rw/NixOS/nixos-config/";
      wolgamma = "wakeonlan -i 192.168.0.162 d8:43:ae:29:fe:d2";
      nixbld-gamma = "cdn && NIX_BUILD_CORES=16 nix build .#nixosConfigurations.kappa.config.system.build.toplevel -L";
      nixsend-kappa = "cdn && nix copy --to 'ssh://rw@kappa' ./result";
    };
  };
}
