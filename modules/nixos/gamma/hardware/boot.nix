{lib, ...}: {
  boot = {
    lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
    };

    loader = {
      systemd-boot.enable = lib.mkForce false;
      systemd-boot.consoleMode = "max";
      efi.canTouchEfiVariables = true;
    };

    plymouth.enable = true;

    consoleLogLevel = 0;

    initrd = {
      systemd.tpm2.enable = true;
      systemd.enable = true;
      verbose = false;
    };

    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "udev.log_level=3"
      "rd.systemd.show_status=auto"
    ];

    hardwareScan = true;
  };
  # systemd.tpm2.enable = true;
  services.tcsd.enable = true;
  security = {
    tpm2 = {
      enable = true;
      pkcs11.enable = true;
      tctiEnvironment.enable = true;
      applyUdevRules = true;
    };
  };
}
