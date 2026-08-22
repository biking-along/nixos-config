{
  username,
  state,
  ...
}: {
  imports = [
    ./age.nix
    ./calibre.nix
    ./dms.nix
    ./email.nix
    # ./homeFiles.nix
    ./homePkgs.nix
    # ./hyprland.nix
    ./kitty.nix
    ./rclone.nix
    ./rofi.nix
    # ./ssh.nix
    # ./waybar.nix
    ./xdg.nix
  ];
  programs.home-manager.enable = true;
  home-manager.users.${username}.home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    stateVersion = "${state}";
  };
}
