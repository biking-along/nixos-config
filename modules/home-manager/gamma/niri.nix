{
  wayland.windowManager.niri = {
    enable = true;
    checkConfig = true;
    systemd.enable = true;
    settings = {
      environment = {
        NIXOS_OZONE_WL = "1";
        MOZ_ENABLE_WAYLAND = "1";
        WLR_NO_HARDWARE_CURSORS = "1";
        GSK_RENDERER = "vulkan";
        LIBVA_DRIVER_NAME = "radeonsi";
        VDPAU_DRIVER = "radeonsi";
        AMD_VULKAN_ICD = "RADV";
        XCURSOR_THEME = "Nordzy-catppuccin-mocha-dark";
        HYPRCURSOR_THEME = "Nordzy-hyprcursors-catppuccin-mocha-dark";
        XCURSOR_SIZE = "24";
        HYPRCURSOR_SIZE = "24";
        TERM = "kitty";
        BROWSER = "firefox";
        QT_QPA_PLATFORM = "wayland";
        ELECTRON_OZONE_PLATFORM_HINT = "auto";
        XDG_CURRENT_DESKTOP = "niri";
      };
      hotkey-overlay = {
        skip-at-startup = {};
      };
      prefer-no-csd = {};
      input = {
        trackball.natural-scroll = {};
        focus-follows-mouse = {
          max-scroll-amount = "95%";
        };
      };
      binds = {
        # Compositor Actions
        "Mod+Shift+Q".action.quit = [];
        "Mod+Q".action.close-window = [];
        "Shift+Space".action.toggle-overview = [];
        "Control+Space".action.spawn = "dms ipc call spotlight toggle";

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
        "Mod+N".action.focus-monitor-left = [];
        "Mod+M".action.focus-monitor-right = [];

        "Mod+Shift+N".action.move-column-to-monitor-left = [];
        "Mod+Shift+M".action.move-column-to-monitor-right = [];

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

        # Volume
        "XF86AudioRaiseVolume".action.spawn = "dms ipc call audio increment 3";
        "XF86AudioLowerVolume".action.spawn = "dms ipc call audio decrement 3";
        "XF86AudioMute".action.spawn = "dms ipc call audio mute";

        # Disable Sleep
        "Mod+Control+T".action.spawn = "dms ipc call inhibit toggle";
        "Mod+Control+Y".action.spawn-sh = "wl-present mirror DP-1 --fullscreen-output HDMI-A-2 --title PiKVM --backend screencopy-dmabuf --show-cursor";

        # Focus Specific Workspace
        "Alt+1".action.focus-workspace = [1];
        "Alt+2".action.focus-workspace = [2];
        "Alt+3".action.focus-workspace = [3];
        "Alt+4".action.focus-workspace = [4];
        "Alt+5".action.focus-workspace = [5];
      };
    };
  };
  services.niri-autoselect-portal.enable = true;
}
