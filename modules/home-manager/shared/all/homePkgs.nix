{pkgs, ...}: {
  home.packages = with pkgs; [
    cbonsai
    cmatrix
    socat
    play
  ];
}
