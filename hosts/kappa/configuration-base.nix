{...}: {
  imports = [../../modules/nixos/kappa/hardware/thermald/thermald.nix];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelParams = [
    "i915.enable_psr=0"
  ];

  boot.initrd.kernelModules = [
    "kvm-intel"
    "surface_aggregator"
    "surface_aggregator_registry"
    "surface_aggregator_hub"
    "surface_hid_core"
    "surface_hid"
    "hid_multitouch"
    "8250_dw"
    "intel_lpss"
    "intel_lpss_pci"
    "xhci_pci"
    "thunderbolt"
    "nvme"
    "usb_storage"
    "sd_mod"
    "surface_kbd"
    "pinctrl_tigerlake"
  ];

  # networking.wireless.enable = lib.mkDefault true;
  # networking.networkmanager.enable = lib.mkDefault false;

  hardware.microsoft-surface.kernelVersion = "stable";
  boot.blacklistedKernelModules = ["surface_gpe"];
}
