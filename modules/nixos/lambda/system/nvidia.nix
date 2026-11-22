{pkgs, ...}: {
  hardware.graphics = {
    enable = true;
  };

  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    open = false;
    branch = "legacy_580";
    nvidiaPersistenced = true;
    modesetting.enable = true;
    nvidiaSettings = true;
    powerManagement.enable = true;
  };

  boot.blacklistedKernelModules = ["nouveau"];

  environment.systemPackages = with pkgs; [
    nvtopPackages.nvidia
  ];
}
