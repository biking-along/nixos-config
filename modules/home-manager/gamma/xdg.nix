{pkgs, ...}: {
  xdg = {
    enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "inode/directory" = ["org.gnome.Nautilus.desktop"];
        "text/html" = ["firefox.desktop"];
        "text/plain" = ["nvim.desktop"];
        "image/png" = ["imv.desktop"];
        "image/svg" = ["imv.desktop"];
        "image/jpg" = ["imv.desktop"];
        "image/jpeg" = ["imv.desktop"];
        "image/webp" = ["imv.desktop"];
        "image/gif" = ["imv.desktop"];
        "image/bmp" = ["imv.desktop"];
        "video/mp4" = ["umpv.desktop"];
        "video/mkv" = ["umpv.desktop"];
        "video/webm" = ["umpv.desktop"];
        "application/zip" = ["org.gnome.Nautilus.desktop"];
        "application/pdf" = ["org.pwmt.zathura.desktop"];
        "application/x-extension-htm" = ["firefox.desktop"];
        "application/x-extension-html" = ["firefox.desktop"];
        "application/x-extension-shtml" = ["firefox.desktop"];
        "application/xhtml+xml" = ["firefox.desktop"];
        "application/x-extension-xhtml" = ["firefox.desktop"];
        "application/x-extension-xht" = ["firefox.desktop"];
        "x-scheme-handler/http" = ["firefox.desktop"];
        "x-scheme-handler/https" = ["firefox.desktop"];
        "x-scheme-handler/chrome" = ["firefox.desktop"];
      };
    };
    portal.extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  };
}
