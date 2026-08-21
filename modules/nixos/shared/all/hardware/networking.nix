{lib, ...}: {
  networking.networkmanager.enable = lib.mkDefault true;
  networking.wireless.enable = false;
}
