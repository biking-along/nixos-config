{ pkgs, config, ... }:

let
  hyprConfig =  pkgs.writeText "greetd-hyprland-conf" ''
    # monitor=DP-1 ,2560x1440@164.96,0x0,1
    exec-once = ${config.programs.regreet.package}/bin/regreet; ${pkgs.hyprland}/bin/hyprctl dispatch exit
    input {
      accel_profile=flat
      follow_mouse=1
      kb_layout=us
      natural_scroll=true
      scroll_factor=0.200000
      sensitivity=-0.600000
    }
    misc {
      disable_hyprland_logo = true
      disable_splash_rendering = true
      disable_hyprland_qtutils_check = true
    }
  '';
in

{
  users.users.greeter = {
    isNormalUser = false;
    description  = "greetd greeter user";
    extraGroups  = [ "video" "audio" ];
    linger        = true;
  };
  programs.regreet.enable = true;
  services.greetd = {
    enable = true;
    # greeterManagesPlymouth = true;
    settings = {
      default_session = {
        command = "${pkgs.hyprland}/bin/hyprland --config ${hyprConfig}";
        user = "greeter";
      };
    };
  };
}

