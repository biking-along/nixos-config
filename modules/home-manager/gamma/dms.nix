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
      hotkey-overlay.skip-at-startup = true;
      prefer-no-csd = true;
      input = {
        trackball.natural-scroll = true;
        focus-follows-mouse = {
          enable = true;
          max-scroll-amount = "95%";
        };
      };

      binds = {
        "Mod+Shift+Q".action.quit.skip-confirmation = true;
        "Mod+Q".action.close-window = [];
        "Mod+Shift+F".action.fullscreen-window = [];
        "Mod+Control+F".action.toggle-window-floating = [];
        "Mod+G".action.maximize-column = [];
        "Mod+B".action.center-column = [];

        "Mod+O".action.toggle-overview = [];

        "Mod+H".action.focus-window-down-or-column-left = [];
        "Mod+J".action.focus-window-or-workspace-down = [];
        "Mod+K".action.focus-window-or-workspace-up = [];
        "Mod+L".action.focus-window-up-or-column-right = [];
        "Mod+Shift+H".action.move-column-left = [];
        "Mod+Shift+J".action.move-window-down = [];
        "Mod+Shift+K".action.move-window-up = [];
        "Mod+Shift+L".action.move-column-right = [];

        "Mod+Minus".action.consume-or-expel-window-left = [];
        "Mod+BracketRight".action.consume-or-expel-window-right = [];

        "Mod+Return".action.spawn = "kitty";
        "Mod+D".action.spawn = "fuzzel";
        "Mod+F".action.spawn = "nautilus";
        "Mod+W".action.spawn = "firefox";

        "Alt+1".action.focus-workspace = 1;
        "Alt+2".action.focus-workspace = 2;
        "Alt+3".action.focus-workspace = 3;
        "Alt+4".action.focus-workspace = 4;
        "Alt+5".action.focus-workspace = 5;
      };
    };
  };
}
