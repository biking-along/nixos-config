{
  pkgs,
  inputs,
  ...
}: {
  nixpkgs.overlays = [inputs.niri.overlays.niri];
  niri-flake.cache.enable = true;
  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
  };
  systemd.user.services.niri-flake-polkit.enable = false;
  networking.firewall = rec {
    allowedTCPPortRanges = [
      {
        from = 1714;
        to = 1764;
      }
    ];
    allowedUDPPortRanges = allowedTCPPortRanges;
  };
  systemd.user.services = {
    kvm-mirror = {
      script = "wl-present mirror DP-1 --fullscreen-output HDMI-A-2 --backend screencopy-dmabuf -S";
      upheldBy = ["niri.service"];
      bindsTo = ["niri.service"];
      serviceConfig = {
        RestartSec = 5;
      };
      after = ["niri.service"];
      aliases = ["present" "wl-present"];
    };
  };
}
