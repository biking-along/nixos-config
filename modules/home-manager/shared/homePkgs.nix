{pkgs, ...}: {
  home.packages = with pkgs; [
    cbonsai
    cmatrix
    deluge
    plex-desktop
    socat
    play
  ];
}
