{pkgs, ...}: {
  home.packages = with pkgs; [
    fortune
    cowsay
    dconf-editor
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
    bitwarden-desktop
    jellyfin-desktop
    pear-desktop
    vesktop
    vlc
    thunderbird
  ];
}
