{pkgs, ...}: {
  environment.systemPackages = [pkgs.gnomeExtensions.gjs-osk];
  services.displayManager.environment.XDG_DATA_DIRS = ":${pkgs.gjs-osk}/share:";
  services.desktopManager.gnome = {
    extraGSettingsOverrides = ''
      [org.gnome.shell]
      enabled-extensions=[ '${pkgs.gjs-osk.uuid}' ]
    '';
  };
}
