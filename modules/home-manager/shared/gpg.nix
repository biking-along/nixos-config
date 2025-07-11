{pkgs, ...}: {
  programs.gpg = {
    enable = true;
    settings = {
      with-keygrip = true;
      with-fingerprint = true;
      keyid-format = "long";
    };
  };
  services.gpg-agent = {
    enable = true;
    enableFishIntegration = true;
    enableSshSupport = true;
    pinentry.package = pkgs.pinentry-gnome3;
  };
}
