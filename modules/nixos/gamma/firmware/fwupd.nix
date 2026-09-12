{pkgs, ...}: {
  services = {
    fwupd.enable = true;
    dbus.packages = [pkgs.fwupd];
    udev.packages = [pkgs.fwupd];
  };
  appstream.enable = true;
}
