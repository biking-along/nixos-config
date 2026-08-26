{
  username,
  state,
  ...
}: {
  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    stateVersion = "${state}";
  };
  programs.home-manager.enable = true;
}
