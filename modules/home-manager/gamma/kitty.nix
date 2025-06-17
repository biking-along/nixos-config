{
  programs.kitty = {
    enable = true;
    enableGitIntegration = true;
    shellIntegration.enableFishIntegration = true;
    extraConfig = "shell fish\nconfirm_os_window_close 0\nmap ctrl+plus change_font_size all +1\nmap ctrl+equal change_font_size all +1\nmap ctrl+kp_add change_font_size all +1\nmap ctrl+minus change_font_size all -1\nmap ctrl+kp_subtract change_font_size all -1\nmap ctrl+underscore change_font_size all -1\nmap ctrl+0 change_font_size all 0\nmap ctrl+kp_0 change_font_size all 0\nrepaint_delay 0\ninput_delay 0\nsync_to_monitor yes\nenable_audio_bell yes\ntab_bar_min_tabs 1\ntab_bar_edge bottom\ntab_bar_style powerline\ntab_powerline_style slanted\ntab_title_template {title}{' :{}:'.format(num_windows) if num_windows > 1 else ''}";
  };
}
