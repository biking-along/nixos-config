{
  lib,
  config,
  username,
  ...
}:
with lib; let
  cfg = config.modules.shared.all.software.tailscale;
in {
  options.modules.shared.all.software.tailscale.enable = mkOption {
    default = true;
    type = types.bool;
    description = ''
      Enable tailscale daemon with universal settings.
    '';
  };
  config = mkIf cfg.enable {
    services.tailscale = {
      enable = true;
      useRoutingFeatures = "client";
      extraSetFlags = [
        "--ssh"
        "--operator=${username}"
      ];
    };
  };
}
