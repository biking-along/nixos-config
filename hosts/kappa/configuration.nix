{ config, pkgs, lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/kappa
    ../../modules/nixos/shared
  ];


  networking.hostName = "kappa";

  system.stateVersion = "25.11";
}

