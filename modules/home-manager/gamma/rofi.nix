{ pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    modes = [
      "drun"
      "calc"
      "emoji"
    ];
    plugins = with pkgs; [
      rofi-calc
      rofi-emoji
    ];
  };
}
