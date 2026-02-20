{...}: {
  programs.dank-material-shell.greeter = {
    enable = true;
    compositor = {
      name = "niri"; # Required. Can be also "hyprland" or "sway"
    };

    # Sync your user's DankMaterialShell theme with the greeter. You'll probably want this
    configHome = "/home/rw";

    # Custom config files for non-standard config locations
    # configFiles = [
    #   "/home/rw/.config/DankMaterialShell/settings.json"
    # ];

    # Save the logs to a file
    logs = {
      save = true;
      path = "/tmp/dms-greeter.log";
    };

    # Custom Quickshell Package
    # quickshell.package = pkgs.quickshell;
  };
}
