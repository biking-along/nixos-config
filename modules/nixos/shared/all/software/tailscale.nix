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
        "--operator=${username}"
      ];
    };
    age.secrets.davfs2 = {
      file = ../../../../../secrets/davfs2.age;
      mode = "0600";
      owner = "root";
      group = "root";
    };
    services.davfs2 = {
      enable = true;
      settings = {
        globalSection = {
          use_locks = false;
          secrets = config.age.secrets.davfs2.path;
        };
      };
    };
    fileSystems."/home/rw/Taildrive" = {
      device = "http://100.100.100.100:8080/";
      fsType = "davfs";
      options = [
        "user"
        "noauto"
        "_netdev"
        "x-systemd.automount"
        "uid=1000"
        "x-systemd.requires=tailscaled.service"
        "x-systemd.after=tailscaled.service"
      ];
    };
  };
}
