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
      extraGroups = ["adm" "docker" "audio" "video" "i2c" "tss" "tty" "dialout" "networkmanager" "wheel" "input" "greeter"];
      openssh = {
        authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMER1vKzrCrhX9L/4EfIfi3Kpe/HUPw0RMc/MbrQSIcs u0_a365@localhost"
        ];
      };
    };
  };
}
