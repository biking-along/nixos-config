{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    settings = {
      monitor = [
        "DP-1 ,2560x1440@164.96,0x0,1"
        "HDMI-A-1 ,1680x1050@59.95,-1050x-120,1,transform,1"
      ];
      exec-once = [
        "uwsm finalize UWSM_FINALIZE_VARNAMES='TERM GSK_RENDERER LIBVA_DRIVER_NAME VDPAU_DRIVER XCURSOR_THEME XCURSOR_SIZE HYPRCURSOR_THEME HYPRCURSOR_SIZE EDITOR VISUAL BROWSER TERMINAL NIXOS_OZONE_WL MOZ_ENABLE_WAYLAND WLR_NO_HARDWARE_CURSORS'"

        "/etc/profiles/per-user/rw/bin/pypr"
      ];
      general = {
        gaps_in = 3;
        gaps_out = 10;
        border_size = 2;
        resize_on_border = false;
        allow_tearing = false;
        layout = "dwindle";
      };
      decoration = {
        rounding = 10;
        rounding_power = 2;
        active_opacity = 1.0;
        inactive_opacity = 0.6;
        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
        };
        blur = {
          enabled = true;
          size = 3;
          passes = 2;
          vibrancy = 0.1696;
          new_optimizations = "on";
          ignore_opacity = "on";
          popups = true;
        };
      };
      animations = {
        enabled = true;
        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];
        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
        ];
      };
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
      master = {
        new_status = "slave";
      };
      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
        render_unfocused_fps = 165;
        enable_swallow = true;
        vrr = 1;
        vfr = 1;
      };
      input = {
        kb_layout = "us";
        follow_mouse = 1;
        sensitivity = -0.6;
        accel_profile = "flat";
        natural_scroll = true;
        scroll_factor = 0.2;
      };
      # cursor = {
      # default_monitor = "DP-1";
      # };
      "$mod" = "SUPER";
      bind = [
        "$mod, RETURN, exec, uwsm-app -- kitty"
        "SHIFT ALT, T, exec, pypr toggle term"
        "$mod, F, exec, uwsm-app -- kitty -e yazi"
        "$mod, TAB, exec, rofi -show drun -show-icons -theme-str 'window {width: 16em; location: center;}' -run-command 'uwsm app -- {cmd}'"
        "$mod, W, exec, uwsm-app -- firefox.desktop"
        "$mod, T, exec, uwsm-app -- btop.desktop"
        "$mod SHIFT, Q, exec, wlogout"
        "ALT SHIFT, Q, exec, uwsm-app -- hyprlock"
        "$mod, BACKSPACE, exec, makoctl dismiss"
        "$mod, Q, killactive,"
        "$mod, V, togglefloating,"
        "$mod, Z, fullscreen"
        "$mod, P, pseudo,"
        "$mod, S, togglesplit,"
        "$mod, N, splitratio, .2"
        "$mod, M, splitratio,-.2"
        "$mod, C, exec, pypr layout_center toggle"
        "$mod, H, exec, pypr layout_center prev"
        "$mod, L, exec, pypr layout_center next"
        "$mod, K, exec, pypr layout_center prev2"
        "$mod, J, exec, pypr layout_center next2"
        "$mod SHIFT, H, swapwindow, l"
        "$mod SHIFT, L, swapwindow, r"
        "$mod SHIFT, K, swapwindow, u"
        "$mod SHIFT, J, swapwindow, d"
        "ALT SHIFT, 1, workspace, 1"
        "ALT SHIFT, 2, workspace, 2"
        "ALT SHIFT, 3, workspace, 3"
        "ALT SHIFT, 4, workspace, 4"
        "ALT SHIFT, 5, workspace, 5"
        "ALT SHIFT, 6, workspace, 6"
        "ALT SHIFT, 7, workspace, 7"
        "ALT SHIFT, 8, workspace, 8"
        "ALT SHIFT, 9, workspace, 9"
        "ALT SHIFT, 0, workspace, 10"
        "$mod, O, workspace, +2"
        "$mod, I, workspace, -2"
        "$mod SHIFT, O, movetoworkspace, +2"
        "$mod SHIFT, I, movetoworkspace, -2"
        "$mod CONTROL, O, movetoworkspace, +1"
        "$mod CONTROL, I, movetoworkspace, -1"
        "$mod, U, focusmonitor, +1"
        "CONTROL ALT, 1, movetoworkspace, 1"
        "CONTROL ALT, 2, movetoworkspace, 2"
        "CONTROL ALT, 3, movetoworkspace, 3"
        "CONTROL ALT, 4, movetoworkspace, 4"
        "CONTROL ALT, 5, movetoworkspace, 5"
        "CONTROL ALT, 6, movetoworkspace, 6"
        "CONTROL ALT, 7, movetoworkspace, 7"
        "CONTROL ALT, 8, movetoworkspace, 8"
        "CONTROL ALT, 9, movetoworkspace, 9"
        "CONTROL ALT, 0, movetoworkspace, 10"
      ];
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ];
      bindl = [
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];
      windowrule = [
        "float,class:^$"
        "float,class:^(mpv)$"
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];
      workspace = [
        "1, monitor:DP-1, default:true"
        "3, monitor:DP-1"
        "5, monitor:DP-1"
        "7, monitor:DP-1"
        "9, monitor:DP-1"
        "2, monitor:HDMI-A-1, default:true"
        "4, monitor:HDMI-A-1"
        "6, monitor:HDMI-A-1"
        "8, monitor:HDMI-A-1"
        "10, monitor:HDMI-A-1"
      ];
    };
  };
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = ["/home/rw/.local/share/backgrounds/nix-mocha.png"];
      wallpaper = [", /home/rw/.local/share/backgrounds/nix-mocha.png"];
    };
  };
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "loginctl lock-session";
        unlock_cmd = "loginctl unlock-session";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
        ignore_dbus_inhibit = false;
        ignore_systemd_inhibit = false;
      };
      listener = [
        {
          timeout = 300;
          on-timeout = "loginctl lock-session";
        }
        {
          timeout = 420;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
        {
          timeout = 600;
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
  services.hyprpolkitagent.enable = true;
  home.pointerCursor.hyprcursor = {
    enable = true;
    size = 24;
  };
  programs.hyprlock = {
    enable = true;
    settings = {
      label = {
        text = "$TIME12";
        font_size = 96;
        position = "80, 600";
        halign = "center";
        walign = "center";
        shadow_passes = 1;
      };
    };
  };
  services.mako = {
    enable = true;
    settings = {
      anchor = "top-right";
      border-radius = 8;
      outer-margin = "15, 15, 5, 5";
    };
  };
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "lock";
        action = "hyprlock";
        text = "";
        keybind = "l";
      }
      {
        label = "logout";
        action = "loginctl terminate-user 1000";
        text = "";
        keybind = "o";
      }
      {
        label = "suspend";
        action = "systemctl suspend";
        text = "";
        keybind = "s";
      }
      {
        label = "hibernate";
        action = "systemctl hibernate";
        text = "";
        keybind = "h";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "";
        keybind = "r";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "";
        keybind = "p";
      }
    ];
  };
}
