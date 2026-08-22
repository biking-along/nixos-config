{
  hardware = {
    enableAllFirmware = true;
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
        settings.allow-writes = true;
      };
    };
  };
  services.acpid.enable = true;
  services.udev.enable = true;
}
