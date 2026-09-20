{
  hardware.graphics = {
    enable = true;
  };

  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    open = false;
    nvidiaPersistenced = true;
    modesetting.enable = true;
    nvidiaSettings = true;
    powerManagement.enable = true;
  };
  boot.blacklistedKernelModules = ["nouveau"];
}
