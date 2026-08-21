{
  config,
  lib,
  pkgs,
  ...
}: {
  documentation.nixos.enable = false;
  environment.systemPackages = [
    # Hide Neovim desktop entry
    (lib.hiPrio (pkgs.runCommand "desktopEntryHide" {} ''
      mkdir -p "$out/share/applications"
      cat "${config.programs.neovim.package}/share/applications/nvim.desktop" > "$out/share/applications/nvim.desktop"
      echo "Hidden=1" >> "$out/share/applications/nvim.desktop"
    ''))
  ];
}
