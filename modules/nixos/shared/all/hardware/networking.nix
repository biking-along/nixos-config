{lib, ...}: {
  networking.networkmanager.enable = lib.mkDefault true;
  networking.wireless.enable = lib.mkDefault false;
}
