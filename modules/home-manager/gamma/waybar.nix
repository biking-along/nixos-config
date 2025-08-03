{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainbar = {
        layer = "top";
        output = ["DP-1"];
        spacing = 4;
        # margin = [9 13 -10 18];

        modules-left = ["hyprland/workspaces" "hyprland/submap" "hyprland/window"];
        modules-center = ["clock"];
        modules-right = ["pulseaudio" "memory" "cpu" "temperature" "bluetooth" "tray"];

        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            urgent = "";
            active = "";
            visible = "";
            default = "";
            empty = "";
          };
          all-outputs = false;
        };
        "hyprland/window" = {
          icon = true;
          max-length = 40;
          rewrite = {
            "(.*) — Mozilla Firefox" = "$1";
          };
          separate-outputs = true;
        };
        "tray" = {
          icon-size = 16;
          show-passive-items = true;
          spacing = 10;
        };
        "clock" = {
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format = "{:%I:%M %p | %b %d}";
        };
        "cpu" = {
          format = " {usage}%";
          tooltip = false;
        };
        "memory" = {
          interval = 30;
          format = " {used}G";
        };
        "temperature" = {
          hwmon-path = "/sys/class/hwmon/hwmon6/temp1_input";
          critical-threshold = 80;
          format = "{icon} {temperatureC}°C";
          format-icons = [""];
        };
        "pulseaudio" = {
          scroll-step = 1;
          format = "{icon} {volume}%";
          format-bluetooth = "{icon}  {volume}% {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {volume}%";
          format-source = " {volume}%";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = ["" "" ""];
          };
        };
        "bluetooth" = {
          format = " {status}";
          format-connected = " {device_alias}";
          format-connected-battery = " {device_alias}: {device_battery_percentage}%";
          format-disabled = "";
          format-off = "";
          interval = 30;
          format-no-controller = "";
        };
      };
      sidebar = {
        layer = "top";
        output = "HDMI-A-1";
        spacing = 4;

        modules-left = ["hyprland/window"];
        modules-center = [];
        modules-right = ["hyprland/workspaces"];

        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            urgent = "";
            active = "";
            visible = "";
            default = "";
            empty = "";
          };
          all-outputs = false;
        };

        "hyprland/window" = {
          icon = true;
          max-length = 40;
          rewrite = {
            "(.*) — Mozilla Firefox" = "$1";
          };
          separate-outputs = true;
        };
      };
    };
    # style = ''
    # * {
    # font-size: 24pt;
    # font-weight: bold;
    # }
    # '';
  };
}
