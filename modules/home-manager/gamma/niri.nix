{
  # wayland.windowManager.niri = {
  #   enable = true;
  #   checkConfig = true;
  #   systemd.enable = true;
  #   settings = {
  #     environment = {
  #       NIXOS_OZONE_WL = "1";
  #       MOZ_ENABLE_WAYLAND = "1";
  #       WLR_NO_HARDWARE_CURSORS = "1";
  #       GSK_RENDERER = "vulkan";
  #       LIBVA_DRIVER_NAME = "radeonsi";
  #       VDPAU_DRIVER = "radeonsi";
  #       AMD_VULKAN_ICD = "RADV";
  #       XCURSOR_THEME = "Nordzy-catppuccin-mocha-dark";
  #       HYPRCURSOR_THEME = "Nordzy-hyprcursors-catppuccin-mocha-dark";
  #       XCURSOR_SIZE = "24";
  #       HYPRCURSOR_SIZE = "24";
  #       TERM = "kitty";
  #       BROWSER = "firefox";
  #       QT_QPA_PLATFORM = "wayland";
  #       ELECTRON_OZONE_PLATFORM_HINT = "auto";
  #       XDG_CURRENT_DESKTOP = "niri";
  #     };
  #     hotkey-overlay = {
  #       skip-at-startup = {};
  #     };
  #     prefer-no-csd = {};
  #     input = {
  #       trackball.natural-scroll = {};
  #       focus-follows-mouse = {
  #         _props.max-scroll-amount = "95%";
  #       };
  #     };
  #     binds = {
  #       # Compositor Actions
  #       "Mod+Shift+Q".quit = [];
  #       "Mod+Q".close-window = [];
  #       "Shift+Space".toggle-overview = [];
  #       "Control+Space".spawn = "dms ipc call spotlight toggle";
  #
  #       # Window States
  #       "Mod+Shift+F".fullscreen-window = [];
  #       "Mod+Control+F".toggle-window-floating = [];
  #       "Mod+G".maximize-column = [];
  #       "Mod+B".center-column = [];
  #
  #       # Focus
  #       "Mod+H".focus-column-left = [];
  #       "Mod+J".focus-window-or-workspace-down = [];
  #       "Mod+K".focus-window-or-workspace-up = [];
  #       "Mod+L".focus-column-right = [];
  #
  #       # Monitors
  #       "Mod+N".focus-monitor-left = [];
  #       "Mod+M".focus-monitor-right = [];
  #
  #       "Mod+Shift+N".move-column-to-monitor-left = [];
  #       "Mod+Shift+M".move-column-to-monitor-right = [];
  #
  #       # Move Windows Around
  #       "Mod+Shift+H".move-column-left = [];
  #       "Mod+Shift+J".move-window-down-or-to-workspace-down = [];
  #       "Mod+Shift+K".move-window-up-or-to-workspace-up = [];
  #       "Mod+Shift+L".move-column-right = [];
  #
  #       # Create Stacks of Windows
  #       "Mod+Minus".consume-or-expel-window-left = [];
  #       "Mod+BracketRight".consume-or-expel-window-right = [];
  #
  #       # Open Apps
  #       "Mod+Return".spawn = "kitty";
  #       "Mod+D".spawn = "fuzzel";
  #       "Mod+F".spawn = "nautilus";
  #       "Mod+W".spawn = "firefox";
  #
  #       # Volume
  #       "XF86AudioRaiseVolume".spawn = "dms ipc call audio increment 3";
  #       "XF86AudioLowerVolume".spawn = "dms ipc call audio decrement 3";
  #       "XF86AudioMute".spawn = "dms ipc call audio mute";
  #
  #       # Disable Sleep
  #       "Mod+Control+T".spawn = "dms ipc call inhibit toggle";
  #       "Mod+Control+Y".spawn-sh = "wl-present mirror DP-1 --fullscreen-output HDMI-A-2 --title PiKVM --backend screencopy-dmabuf --show-cursor";
  #
  #       # Focus Specific Workspace
  #       "Alt+1".focus-workspace = [1];
  #       "Alt+2".focus-workspace = [2];
  #       "Alt+3".focus-workspace = [3];
  #       "Alt+4".focus-workspace = [4];
  #       "Alt+5".focus-workspace = [5];
  #     };
  #   };
  # };
  # services.niri-autoselect-portal.enable = true;
}
