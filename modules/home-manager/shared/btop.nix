{lib, ...}: {
  programs.btop = {
    enable = true;
    settings = {
      theme_background = lib.mkDefault true;
    };
  };
}
