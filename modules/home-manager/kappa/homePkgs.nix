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
    jellyfin-media-player
    youtube-music
    vesktop
    vlc
    thunderbird
    gimp
  ];
}
