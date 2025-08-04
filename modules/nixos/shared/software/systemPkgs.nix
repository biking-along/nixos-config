{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    git
    git-crypt
    curl
    wget
    gawk
    cbonsai
  ];
}
