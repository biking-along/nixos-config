{pkgs, ...}: {
  hardware = {
    enableAllFirmware = true;
    enableRedistributableFirmware = true;
    i2c.enable = true;
    cpu.x86.msr = {
      enable = true;
      settings.allow-writes = "on";
    };
    cpu.intel.sgx.provision.enable = true;
  };

  services = {
    fwupd.enable = true;
    dbus.packages = [pkgs.fwupd];
    udev.packages = [pkgs.fwupd];
  };

  appstream.enable = true;
}
