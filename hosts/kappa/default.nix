{ host, ... }:

{
  imports = [
    ./configuration-base.nix
    ./configuration.nix
    ./hardware-configuration.nix
    ../../modules/nixos/${host}
    ../../modules/nixos/shared
  ];
}
