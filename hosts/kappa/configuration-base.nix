{ config, lib, pkgs, ... }:

{
  imports = [ ../../modules/kappa/hardware/thermald/thermald.nix ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelParams = [
    # Mitigate screen flickering
    "i915.enable_psr=0"
  ];

  boot.initrd.kernelModules = [
    "surface_aggregator"
    "surface_aggregator_registry"
    "surface_aggregator_hub"
    "surface_hid_core"
    "surface_hid"
    "pinctrl-tigerlake"
    "intel_lpss"
    "intel_lpss_pci"
    "8250_dw"
    "surface_platform_profile"
    "surface_kbd"
    "surface_acpi_notify"
    "surface_battery"
    "surface_charger"
    "surface_aggregator_cdev"
  ];

  # Use wpa_supplicant in iso but not for full install
  networking.wireless.enable = lib.mkDefault true;
  networking.networkmanager.enable = lib.mkDefault false;

  hardware.microsoft-surface.kernelVersion = "stable";

  # Disable the problematic suspend kernel module, it makes waking up
  # impossible after closing the cover.
  boot.blacklistedKernelModules = [ "surface_gpe" ];
}
