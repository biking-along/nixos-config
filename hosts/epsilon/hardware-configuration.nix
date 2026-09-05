{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/profiles/qemu-guest.nix")
  ];
  boot = {
    initrd = {
      availableKernelModules = ["ahci" "virtio_pci" "virtio_scsi" "xhci_pci" "sr_mod" "virtio_blk"];
      kernelModules = [];
    };
    kernelModules = [];
    extraModulePackages = [];
  };
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/3a2be263-8394-400c-b84c-91b4c407cc5c";
    fsType = "ext4";
  };
  fileSystems."/boot" = {
    device = "/dev/disk/by/uuid/F595-37E8";
    fsType = "vfat";
    options = ["fmask=0077" "dmask=0077"];
  };
  swapDevices = [
    {device = "/dev/disk/by-uuid/f3894b08-7901-4223-9ba8-4f6c0bdb997b";}
  ];
  networking.useDHCP = lib.mkdefault true;
  nixpkgs.hostPlatform = lib.mkdefault "x86_64-linux";
}
