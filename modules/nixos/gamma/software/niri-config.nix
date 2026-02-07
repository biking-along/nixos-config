{pkgs, ...}: {
  programs.niri = {
    enable = true;
    package = pkgs.unstable;
  };

  programs.dank-material-shell = {
    enable = false;
    niri = {
      enableKeybinds = true; # Sets static preset keybinds
      enableSpawn = true; # Auto-start DMS with niri, if enabled
    };
  };
}
