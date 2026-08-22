{host, ...}: {
  imports = [
    ./configuration.nix
    ../../modules/nixos/${host}
    ../../modules/nixos/shared
  ];
}
