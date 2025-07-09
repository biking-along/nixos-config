{ config, lib, pkgs, ... }: 

{
  documentation.nixos.enable = false;
  environment.systemPackages = [

    # Hide Neovim desktop entry
    (lib.hiPrio (pkgs.runCommand "desktopEntryHide" { } ''
      mkdir -p "$out/share/applications"

      cat "${config.programs.neovim.package}/share/applications/nvim.desktop" > "$out/share/applications/nvim.desktop"
      echo "Hidden=1" >> "$out/share/applications/nvim.desktop"

      cat "${config.programs.fish.package}/share/applications/fish.desktop" > "$out/share/applications/fish.desktop"
      echo "Hidden=1" >> "$out/share/applications/fish.desktop"

      cat "${config.programs.yazi.package}/share/applications/yazi.desktop" > "$out/share/applications/yazi.desktop"
      echo "Hidden=1" >> "$out/share/applications/yazi.desktop"
    ''))

    # Hide fish desktop entry
    # (lib.hiPrio (pkgs.runCommand "fish-desktop-hide" { } ''
      # mkdir -p "$out/share/applications"
      # cat "${config.programs.fish.package}/share/applications/fish.desktop" > "$out/share/applications/fish.desktop"
      # echo "Hidden=1" >> "$out/share/applications/fish.desktop"
    # ''))

  ];
}
