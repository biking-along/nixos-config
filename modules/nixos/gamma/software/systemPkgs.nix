{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    wget
    curl
    git
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
