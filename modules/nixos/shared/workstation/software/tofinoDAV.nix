{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.shared.workstation.software.tofinoDAV;
in {
  options.modules.shared.workstation.software.tofinoDAV.enable = mkOption {
    default = false;
    type = types.bool;
    description = ''
      Enable mounting of Tofino webdav via davfs2. Taildrive must be enabled to set davfs2 settings and read age secrets.
    '';
  };
  config = mkIf cfg.enable {
    fileSystems."/home/rw/TofinoDAV" = {
      device = "https://bikingalong.tofino.usbx.me/webdav/";
      fsType = "davfs";
      options = [
        "user"
        "noauto"
        "_netdev"
        "x-systemd.automount"
        "uid=1000"
        "gid=31"
      ];
    };
  };
}
