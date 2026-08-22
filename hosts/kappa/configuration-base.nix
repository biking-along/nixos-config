{...}: {
  imports = [../../modules/nixos/kappa/hardware/thermald/thermald.nix];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelParams = [
    "i915.enable_psr=0"
  ];

  boot.initrd.kernelModules = [
    "pinctrl-tigerlake"
    "surface_aggregator"
    "surface_aggregator_registry"
    "surface_aggregator_hub"
    "surface_hid_core"
    "surface_hid"
    "intel_lpss"
    "intel_lpss_pci"
    "8250_dw"
    "surface_platform_profile"
    "surface_kbd"
    "surface_acpi_notify"
    "surface_battery"
    "surface_charger"
    "surface_aggregator_cdev"
    "intel_quickspi"
    "surface_hotplug"
  ];

  # networking.wireless.enable = lib.mkDefault true;
  # networking.networkmanager.enable = lib.mkDefault false;

  hardware.microsoft-surface.kernelVersion = "stable";
  boot.blacklistedKernelModules = ["surface_gpe"];
}
