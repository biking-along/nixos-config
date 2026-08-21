{
  lib,
  config,
  ...
}: {
  config.age.secrets.wirelessSecrets = {
    file = ../../../../../secrets/wirelessSecrets.age;
    mode = "770";
  };
  networking.networkmanager.enable = lib.mkDefault true;
  networking.wireless = {
    enable = true;
    enableHardening = false;
    secretsFile = config.age.secrets.wirelessSecrets.path;
    networks = {
      RyFi = {
        pskRaw = "ext:ryfiPass";
      };
    };
  };
}
