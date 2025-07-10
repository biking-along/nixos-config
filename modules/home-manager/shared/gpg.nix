{pkgs, ...}: {
  programs.gpg = {
    enable = true;
  };
  services.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-gnome3;
  };
}
