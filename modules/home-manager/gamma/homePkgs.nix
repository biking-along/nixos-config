{ pkgs, ... }:

{
  home.packages = with pkgs; [
    fortune
    nordzy-cursor-theme
    cowsay
    thunderbird
    chromium
    dconf-editor
    orca-slicer
    freecad-wayland
    openscad
    bluetui
    hyprpicker
    hyprnotify
    vial
    qmk
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
    wl-clipboard
    fzf
    ripgrep
    fd
    microfetch
  ];
}
