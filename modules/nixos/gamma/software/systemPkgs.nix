{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    vulkan-loader
    vulkan-validation-layers
    vulkan-extension-layer
    vulkan-tools
    gnumake
    gcc-arm-embedded
    gcc
    sbctl
    tpm2-tools
  ];
}
