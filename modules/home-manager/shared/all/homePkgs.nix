{
  username,
  pkgs,
  ...
}: {
  home-mangager.users.${username}.home.packages = with pkgs; [
    cbonsai
    cmatrix
    socat
    play
  ];
}
