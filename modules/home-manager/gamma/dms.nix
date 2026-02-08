{
  programs.dank-material-shell = {
    enable = true;
    niri = {
      enableKeybinds = true; # Sets static preset keybinds
      enableSpawn = true; # Auto-start DMS with niri, if enabled
    };
  };

  programs.niri = {
    settings = {
      prefer-no-csd = true;
      input = {
        trackball.natural-scroll = true;
        focus-follows-mouse.enable = true;
      };

      binds = {
        "Mod+Shift+Q".action.quit.skip-confirmation = true;
        "Mod+Q".action.close-window = [];

        "Mod+O".action.toggle-overview = [];

        "Mod+H".action.focus-window-down-or-column-left = [];
        "Mod+J".action.focus-window-or-workspace-down = [];
        "Mod+K".action.focus-window-or-workspace-up = [];
        "Mod+L".action.focus-window-up-or-column-right = [];
        "Mod+Shift+H".action.move-column-left = [];
        "Mod+Shift+J".action.move-window-down = [];
        "Mod+Shift+K".action.move-window-up = [];
        "Mod+Shift+L".action.move-column-right = [];

        "Mod+-".action.consume-or-expel-window-left = [];
        "Mod+BracketRight".action.consume-or-expel-window-right = [];

        "Mod+Return".action.spawn = "kitty";
        "Mod+D".action.spawn = "fuzzel";
        "Mod+F".action.spawn = "nautilus";
        "Mod+W".action.spawn = "firefox";

        "Shift+1".action.focus-workspace = 1;
        "Shift+2".action.focus-workspace = 2;
        "Shift+3".action.focus-workspace = 3;
        "Shift+4".action.focus-workspace = 4;
        "Shift+5".action.focus-workspace = 5;
      };
    };
  };
}
