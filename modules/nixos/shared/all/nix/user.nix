{
  pkgs,
  username,
  ...
}: {
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
          "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBBBNtCaUz9U8IgJBFc47/BFLOnomnEzeb/ftTzSpEWjex4hTPDQXnviigQ5AZAfjLwfqODYlQyU9NDnjuYTx4MA="
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAsH1Nlv75vVgwCMcTwPa8tt11Z+2Ak7YUqtH8/5UkFb"
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDoN0lsT2cyxUgcx/mKe/WZM9BGTxd50azlFLsB08Iw1"
        ];
      };
    };
  };
}
