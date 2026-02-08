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
        # Compositor Actions
        "Mod+Shift+Q".action.quit = [];
        "Mod+Q".action.close-window = [];
        "Mod+O".action.toggle-overview = [];

        # Window States
        "Mod+Shift+F".action.fullscreen-window = [];
        "Mod+Control+F".action.toggle-window-floating = [];
        "Mod+G".action.maximize-column = [];
        "Mod+B".action.center-column = [];

        # Focus
        "Mod+H".action.focus-column-left = [];
        "Mod+J".action.focus-window-or-workspace-down = [];
        "Mod+K".action.focus-window-or-workspace-up = [];
        "Mod+L".action.focus-column-right = [];

        # Monitors
        "Mod+Shift+N".action.focus-monitor-left = [];
        "Mod+Shift+M".action.focus-monitor-right = [];

        "Mod+Control+N".action.move-column-to-monitor-left = [];
        "Mod+Control+M".action.move-column-to-monitor-right = [];

        # Move Windows Around
        "Mod+Shift+H".action.move-column-left = [];
        "Mod+Shift+J".action.move-window-down-or-to-workspace-down = [];
        "Mod+Shift+K".action.move-window-up-or-to-workspace-up = [];
        "Mod+Shift+L".action.move-column-right = [];

        # Create Stacks of Windows
        "Mod+Minus".action.consume-or-expel-window-left = [];
        "Mod+BracketRight".action.consume-or-expel-window-right = [];

        # Open Apps
        "Mod+Return".action.spawn = "kitty";
        "Mod+D".action.spawn = "fuzzel";
        "Mod+F".action.spawn = "nautilus";
        "Mod+W".action.spawn = "firefox";

        # Disable Sleep
        "Mod+Control+T".action.spawn = "dms ipc call inhibit enable";
        # Allow Sleep
        "Mod+Control+Y".action.spawn = "dms ipc call inhibit disable";

        # Focus Specific Workspace
        "Alt+1".action.focus-workspace = 1;
        "Alt+2".action.focus-workspace = 2;
        "Alt+3".action.focus-workspace = 3;
        "Alt+4".action.focus-workspace = 4;
        "Alt+5".action.focus-workspace = 5;
      };
    };
  };
}
