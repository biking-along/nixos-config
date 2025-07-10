{pkgs, ...}: {
  programs.gpg = {
    enable = true;
  };
  programs.gnupg.agent = {
    pinentryPackage = pkgs.pinentry-gnome3;
  };
}
