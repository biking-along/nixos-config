{
  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
    };
    # waybar.enable = true;
  };
  security.pam.services.hyprlock = {};
}
