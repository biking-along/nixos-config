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
    };
  };
}
