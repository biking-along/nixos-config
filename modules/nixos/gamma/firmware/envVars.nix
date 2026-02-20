{
  environment.sessionVariables = {
    NIXOS_OZONE_WL = 1;
    MOZ_ENABLE_WAYLAND = 1;
    WLR_NO_HARDWARE_CURSORS = 1;
    GSK_RENDERER = "vulkan";
    LIBVA_DRIVER_NAME = "radeonsi";
    VDPAU_DRIVER = "radeonsi";
    AMD_VULKAN_ICD = "RADV";
    # RADV_TEX_ANISO = 16;
    XCURSOR_THEME = "Nordzy-catppuccin-mocha-dark";
    HYPRCURSOR_THEME = "Nordzy-hyprcursors-catppuccin-mocha-dark";
    XCURSOR_SIZE = 24;
    HYPRCURSOR_SIZE = 24;
    TERMINAL = "kitty";
    TERM = "kitty";
    BROWSER = "firefox";
    EDITOR = "nvim";
    VISUAL = "nvim";
    QT_QPA_PLATFORM = "wayland";
    QT_QPA_PLATFORMTHEME = "gtk3";
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
  };
}
