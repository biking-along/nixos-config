{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    lm_sensors
    iptsd
    binutils
    libwacom-surface
  ];
}
