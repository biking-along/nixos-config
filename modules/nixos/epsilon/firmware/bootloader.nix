{pkgs, ...}: {
  boot = {
    kernelParams = ["console=ttyS0,115200n8"];
    consoleLogLevel = 7;
    loader = {
      grub = {
        enable = true;
        device = "/dev/sda";
        useOSProber = true;
        extraConfig = ''
          serial --speed=115200 --unit=0 --word=8 --parity=no --stop=1
          terminal_input serial
          terminal_output serial
        '';
      };
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };
  systemd.services = {
    "serial-getty@" = {
      enable = false;
    };
    "serial-getty@ttyS0" = {
      enable = true;
      wantedBy = ["getty.target"];
      after = ["systemd-user-sessions.service"];
      wants = ["systemd-user-sessions.service"];
      serviceConfig = {
        Type = "idle";
        Restart = "always";
        Environment = "TERM=vt220";
        ExecStart = "${pkgs.util-linux}/bin/agetty --login-program ${pkgs.shadow}/bin/login --noclear --keep-baud ttyS0 115200,57600,38400,9600 vt220";
        UtmpIdentifier = "ttyS0";
        StandardInput = "tty";
        StandardOutput = "tty";
        TTYPath = "/dev/ttyS0";
        TTYReset = "yes";
        TTYVHangup = "yes";
        IgnoreSIGPIPE = "no";
        SendSIGHUP = "yes";
      };
    };
  };
  hardware = {
    enableAllFirmware = true;
  };
}
