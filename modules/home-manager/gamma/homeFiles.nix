{config, ...}: {
  xdg.configFile = {
    "pyprland.toml" = {
      enable = true;
      target = "./hypr/pyprland.toml";
      text = ''
        [pyprland]
        plugins = [
          "layout_center",
          "scratchpads",
          "shift_monitors",
          "workspaces_follow_focus"
        ]

        [layout_center]
        margin = 60
        offset = [
          0,
          30,
        ]
        next = "movefocus r"
        prev = "movefocus l"
        next2 = "movefocus d"
        prev2 = "movefocus u"

        [workspaces_follow_focus]
        max_workspaces = 9

        [scratchpads.term]
        animation = "fromTop"
        command = "kitty --class kitty-dropterm"
        class = "kitty-dropterm"
        size = "75% 60%"
      '';
    };
    "uwsm/env".source = "${config.home.sessionVariablesPackage}/etc/profile.d/hm-session-vars.sh";
  };
}
