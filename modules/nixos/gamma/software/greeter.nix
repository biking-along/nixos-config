{
  services.displayManager.dms-greeter = {
    enable = true;
    compositor = {
      name = "niri";
    };
    configHome = "/home/rw";
    configFiles = [
      "/home/rw/.config/DankMaterialShell/settings.json"
    ];
    # logs = {
    #   save = true;
    #   path = "/tmp/dms-greeter.log";
    # };
  };
}
