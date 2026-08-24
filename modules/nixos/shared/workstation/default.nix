{lib, ...}: {
  imports = [
    ./hardware
    ./software
  ];
  config = {
    config.workstation.software.enable = lib.mkDefault true;
    config.workstation.hardware.enable = lib.mkDefault true;
  };
}
