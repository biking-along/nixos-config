{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.workstation.software.taildrive.enable;
in {
  options.modules.workstation.software.taildrive.enable = mkOption {
    default = false;
    type = types.bool;
    description = ''
      Enable the automounting of the lambda nas through taildrive.
    '';
  };
  config = mkIf cfg.enable {
    age.secrets.davfs2 = {
      file = ../../../../../secrets/davfs2.age;
      path = "/etc/davfs2/secrets";
      mode = "0600";
      owner = "root";
      group = "root";
    };
    services.davfs2 = {
      enable = true;
      settings = {
        globalSection = {
          use_locks = false;
          buf_size = 64;
        };
      };
    };
    fileSystems."/home/rw/Taildrive" = {
      device = "http://100.100.100.100:8080/headscale.bikingalong.com/lambda/nas/";
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
