{pkgs, ...}: {
  hardware = {
    enableAllFirmware = true;
    enableRedistributableFirmware = true;
    i2c.enable = true;
  };

  services = {
    fwupd.enable = true;
    dbus.packages = [pkgs.fwupd];
    udev.packages = [pkgs.fwupd];
  };
}
