{pkgs, ...}: {
  dconf = {
    enable = true;
    settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false; # enables user extensions
        enabled-extensions = [
          pkgs.gnomeExtensions.blur-my-shell.extensionUuid
          pkgs.gnomeExtensions.appindicator.extensionUuid
          pkgs.gnomeExtensions.gjs-osk.extensionUuid
          pkgs.gnomeExtensions.tailscale.extensionUuid
          pkgs.gnomeExtensions.touchshell.extensionUuid
          "tabula-osk@besho-sho"
        ];
      };
    };
  };
}
