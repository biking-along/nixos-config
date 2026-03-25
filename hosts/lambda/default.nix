{ host, ... }:
{
  imports = [
    ./configuration.nix
    ./hardware-configuration.nix
    ../../modules/nixos/lambda
    ../../modules/nixos/shared
  ];
}
