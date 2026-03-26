{host, ...}: {
  imports = [
    ./configuration.nix
    ./hardware-configuration.nix
    ../../modules/nixos/${host}
    ../../modules/nixos/shared/nix
    ../../modules/nixos/shared/firmware
    ../../modules/nixos/shared/software/fonts.nix
  ];
}
