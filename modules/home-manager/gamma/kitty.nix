{
  programs.kitty = {
    enable = true;
    enableGitIntegration = true;
    shellIntegration.enableFishIntegration = true;
    extraConfig = ''
      shell fish
      confirm_os_window_close 0
      map ctrl+plus change_font_size all +1
      map ctrl+equal change_font_size all +1
      map ctrl+kp_add change_font_size all +1
      map ctrl+minus change_font_size all -1
      map ctrl+kp_subtract change_font_size all -1
      map ctrl+underscore change_font_size all -1
      map ctrl+0 change_font_size all 0
      map ctrl+kp_0 change_font_size all 0
      repaint_delay 0
      input_delay 0
      sync_to_monitor yes
      enable_audio_bell yes
      tab_bar_min_tabs 1
      tab_bar_edge bottom
      tab_bar_style powerline
      tab_powerline_style slanted
      tab_title_template {title}{" :{}:".format(num_windows) if num_windows > 1 else ""}
    '';
  };
}
