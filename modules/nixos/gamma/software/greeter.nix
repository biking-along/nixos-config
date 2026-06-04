{...}: {
  programs.dank-material-shell.greeter = {
    enable = true;
    compositor = {
      name = "niri"; # Required. Can be also "hyprland" or "sway"
    };
    configHome = "/home/rw";
    configFiles = [
      "/home/rw/.config/DankMaterialShell/monitors.json"
    ];
    logs = {
      save = true;
      path = "/tmp/dms-greeter.log";
    };
  };
}
