{
  programs.retroarch = {
    cores = {
      snes9x.enable = true;
      mupen64plus.enable = true;
      mgba.enable = true;
      mesen.enable = true;
      sameboy.enable = true;
      dolphin.enable = true;
      beetle-psx.enable = true;
      pcsx2.enable = true;
    };
    settings = {
      config_save_on_exit = "false";
      cheevos_enable = "false";
    };
  };
}
