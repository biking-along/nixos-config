{
  lib,
  config,
  inputs,
  ...
}:
with lib; let
  cfg = config.modules.shared.all.nix.agenix;
in {
  options.modules.shared.all.nix.agenix.enable = mkOption {
    default = true;
    type = types.bool;
    description = ''
      Add agenix to system packages.
    '';
  };
  config = mkIf cfg.enable {
    environment.systemPackages = [
      inputs.agenix.packages.x86_64-linux.default
    ];
    age.identityPaths = ["/home/rw/.ssh/id_ed25519"];
  };
}
