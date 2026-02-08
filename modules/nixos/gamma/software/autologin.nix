{username, ...}: {
  services.getty.autologinUser = "${username}";
  programs.fish.loginShellInit = ''
    niri
  '';
}
