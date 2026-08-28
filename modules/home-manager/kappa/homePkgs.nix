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
    microfetch
    bitwarden-desktop
    jellyfin-desktop
    jellyfin-mpv-shim
    pear-desktop
    vesktop
    vlc
    thunderbird
  ];
}
