{
  pkgs,
  inputs,
  ...
}: let
  tabula-osk = pkgs.stdenv.mkDerivation {
    pname = "gnome-shell-extension-tabula-osk";
    version = inputs.tabula-osk-src.shortRev or "dirty";

    src = inputs.tabula-osk-src;

    nativeBuildInputs = [pkgs.glib];

    passthru.extensionUuid = "tabula-osk@besho-sho";

    unpackPhase = ''
      runHook preUnpack
      if [ -d "$src" ]; then
        cp -r "$src"/. .
        chmod -R u+w .
      else
        unpackFile "$src"
        # If unpackFile extracted into a single subdirectory, enter it
        for d in */; do
          if [ -f "$d/metadata.json" ]; then
            cd "$d"
            break
          fi
        done
      fi
      runHook postUnpack
    '';

    buildPhase = ''
      runHook preBuild
      if [ -d schemas ]; then
        glib-compile-schemas schemas/
      fi
      runHook postBuild
    '';

    installPhase = ''
      runHook preInstall
      local dst="$out/share/gnome-shell/extensions/tabula-osk@besho-sho"
      mkdir -p "$dst"
      cp -r *.js *.css *.json *.txt schemas "$dst/"
      runHook postInstall
    '';
  };
in {
  environment.systemPackages = with pkgs; [
    tabula-osk
    enchant2
    hunspell
    hunspellDicts.en_US
    atkinson-hyperlegible-next
  ];

  # Optional: Enable Typing Booster for 6-candidate word predictions
  i18n.inputMethod = {
    enable = true;
    type = "ibus";
    ibus.engines = with pkgs.ibus-engines; [
      typing-booster
    ];
  };
}
