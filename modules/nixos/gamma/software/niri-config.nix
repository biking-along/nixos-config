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
}
