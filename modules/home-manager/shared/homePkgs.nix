{pkgs, ...}: {
  home.packages = with pkgs; [
    cbonsai
    cmatrix
    plex-desktop
  ];
}
