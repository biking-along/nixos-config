{pkgs, ...}: {
  programs = {
    steam = {
      enable = true;
      extraCompatPackages = with pkgs; [proton-ge-bin];
      # gamescopeSession.enable = true;
      protontricks.enable = true;
    };

    gamescope = {
      enable = true;
      capSysNice = true;
    };

    gamemode = {
      enable = true;
    };
  };

  # hardware.xpadneo.enable = true;
}
