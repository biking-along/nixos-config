{ pkgs, ... }:

{
  home.packages = with pkgs; [
    fortune
    cowsay
    thunderbird
    chromium
    dconf-editor
    orca-slicer
    freecad-wayland
    openscad
    foliate
    bluetui
    hyprpicker
    hyprnotify
    discordo
    irssi
    vial
    qmk
    zathura
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
  ];
}
