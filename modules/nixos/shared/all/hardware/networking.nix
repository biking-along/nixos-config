{lib, ...}: {
  # age.secrets.wirelessSecrets = {
  #   file = ../../../../../secrets/wirelessSecrets.age;
  #   mode = "770";
  # };
  networking.networkmanager.enable = lib.mkDefault true;
  networking.wireless = {
    enable = lib.mkDefault true;
    enableHardening = false;
    # secretsFile = "/run/agenix/wirelessSecrets";
    # networks = {
    #   RyFi = {
    #     pskRaw = "ext:ryfiPass";
    #   };
    # };
  };
}
