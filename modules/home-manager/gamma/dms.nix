{lib, ...}: {
  programs.dank-material-shell = {
    enable = true;
    niri = {
      enableKeybinds = true; # Sets static preset keybinds
      enableSpawn = true; # Auto-start DMS with niri, if enabled
    };
    settings = {
      currentThemeName = lib.mkForce "dynamic";
      currentThemeCategory = lib.mkForce "dynamic";
      launcherLogoMode = "os";
      use24HourClock = false;
      useAutoLocation = true;
      weatherEnabled = true;
      useFahrenheit = true;
      windSpeedUnit = "mph";
      showBattery = false;
      hideBrightnessSlider = true;
      acMonitorTimeout = 900;
      acLockTimeout = 0;
      acSuspendTimeout = 1200;
      acSuspendBehavior = 0;

      barConfigs = [
        {
          id = "default";
          name = "Main Bar";
          enabled = true;
          position = 0;
          screenPreferences = [
            {
              name = "DP-1";
              model = "M27Q P";
            }
          ];
          showOnLastDisplay = false;
          leftWidgets = [
            "launcherButton"
            "workspaceSwitcher"
            "focusedWindow"
          ];
          centerWidgets = [
            "music"
            "clock"
            "weather"
          ];
          rightWidgets = [
            "systemTray"
            "clipboard"
            "cpuUsage"
            "memUsage"
            "notificationButton"
            "controlCenterButton"
          ];
          spacing = 4;
          innerPadding = 4;
          bottomGap = 0;
          transparency = 1;
          widgetTransparency = 1;
          squareCorners = false;
          noBackground = false;
          gothCornersEnabled = false;
          gothCornerRadiusOverride = false;
          gothCornerRadiusValue = 12;
          borderEnabled = false;
          borderColor = "surfaceText";
          borderOpacity = 1;
          borderThickness = 1;
          fontScale = 1;
          autoHide = false;
          autoHideDelay = 250;
          openOnOverview = false;
          visible = true;
          popupGapsAuto = true;
          popupGapsManual = 4;
        }
      ];

      controlCenterWidgets = [
        {
          id = "volumeSlider";
          enabled = true;
          width = 100;
        }
        {
          id = "wifi";
          enabled = true;
          width = 50;
        }
        {
          id = "bluetooth";
          enabled = true;
          width = 50;
        }
        {
          id = "audioOutput";
          enabled = true;
          width = 50;
        }
        {
          id = "audioInput";
          enabled = true;
          width = 50;
        }
        {
          id = "nightMode";
          enabled = true;
          width = 50;
        }
        {
          id = "darkMode";
          enabled = true;
          width = 50;
        }
      ];
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
  programs.dsearch.enable = {
    enable = true;
  };
}
