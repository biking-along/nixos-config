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
    sshKeys = "F74F464BA31CDEB2AD8F547E9E989DF888F03B0C";
    pinentry.package = pkgs.pinentry-gnome3;
  };
}
