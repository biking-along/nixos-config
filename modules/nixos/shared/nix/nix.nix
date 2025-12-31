{
  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      trusted-users = ["rw"];
    };
  };
  nixpkgs.config.allowUnfree = true;
  services.flatpak.enable = true;
}
