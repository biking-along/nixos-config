{
  hardware = {
    enableAllFirmware = true;
    deviceTree.enable = true;
    i2c.enable = true;
    cpu = {
      intel = {
        updateMicrocode = true;
        sgx = {
          enableDcapCompat = true;
          provision.enable = true;
        };
      };
      x86.msr = {
        enable = true;
        settings.allow-writes = "on";
      };
    };
  };
  services.acpid.enable = true;
  services.udev.enable = true;
  services.ntp.enable = true;
}
