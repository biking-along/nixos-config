{host, ...}: {
  imports = [
    ./configuration.nix
    ../../modules/nixos/${host}
    ../../modules/nixos/shared/firmware
    ../../modules/nixos/shared/nix
    ../../modules/nixos/shared/software/fonts.nix
    ../../modules/nixos/shared/software/openssh.nix
  ];
}
