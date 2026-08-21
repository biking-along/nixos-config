{host, ...}: {
  imports = [
    ./configuration.nix
    ./hardware-configuration.nix
    ../../modules/nixos/${host}
    ../../modules/nixos/shared
    ../../modules/nixos/shared/workstation
  ];
}
