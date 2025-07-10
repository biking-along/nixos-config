{pkgs, ...}: {
  services.udev = {
    enable = true;
    packages = with pkgs; [vial via];
  };
}
