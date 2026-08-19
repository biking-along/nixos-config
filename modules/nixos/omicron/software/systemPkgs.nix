{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    neovim
    wget
    git
    curl
    wsl-open
    dejavu_fonts
    noto-fonts-color-emoji
  ];
}
