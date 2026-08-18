{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    neovim
    wget
    git
    curl
    dejavu_fonts
  ];
}
