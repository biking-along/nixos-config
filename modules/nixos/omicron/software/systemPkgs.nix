{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    neovim
    wget
    git
    curl
    wsl2-ssh-agent
    wsl-open
    dejavu_fonts
    noto-fonts-color-emoji
  ];
}
