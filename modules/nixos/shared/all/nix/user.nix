{
  lib,
  pkgs,
  config,
  username,
  ...
}:
with lib; let
  cfg = config.modules.shared.all.nix.user;
in {
  options = {
    modules.shared.all.nix.user = {
      enable = mkOption {
        default = true;
        type = types.bool;
        description = ''
          Enable universal user settings.
        '';
      };
    };
  };
  config = mkIf cfg.enable {
    programs.fish = {
      enable = true;
      useBabelfish = true;
    };
    users = {
      defaultUserShell = pkgs.fish;
      users.${username} = {
        isNormalUser = true;
        description = "Ryan Williams";
        extraGroups = ["adm" "docker" "audio" "video" "i2c" "tss" "tty" "dialout" "networkmanager" "wheel" "input" "greeter" "msr" "sgx-prv"];
        openssh = {
          authorizedKeys.keys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMER1vKzrCrhX9L/4EfIfi3Kpe/HUPw0RMc/MbrQSIcs"
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAsH1Nlv75vVgwCMcTwPa8tt11Z+2Ak7YUqtH8/5UkFb"
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJg//gZtFBIGWikK9gHgopA+rr1GCHfA+iuBurXJXWGl"
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDoN0lsT2cyxUgcx/mKe/WZM9BGTxd50azlFLsB08Iw1"
          ];
        };
      };
    };
  };
}
