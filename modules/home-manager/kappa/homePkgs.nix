{ pkgs, ... }:

{
  home.packages = with pkgs; [
    fortune
    cowsay
    thunderbird
    dconf-editor
    foliate
    ffmpeg
    file
    unzip
    p7zip
    ffmpeg
    jq
    poppler
    zoxide
    resvg
    imagemagick
    fzf
    ripgrep
    fd
  ];
}
