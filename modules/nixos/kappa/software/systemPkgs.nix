{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim
    gawk
    wget
    lm_sensors
    iptsd
    binutils
    coreutils
  ];
}
