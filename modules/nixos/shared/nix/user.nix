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
      extraGroups = ["audio" "video" "i2c" "tss" "tty" "dialout" "networkmanager" "wheel" "input" "greeter"];
    };
  };
}
