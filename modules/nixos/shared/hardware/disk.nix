{
  services.fstrim.enable = true;
  boot.tmp = {
    cleanOnBoot = true;
    tmpfsSize = "50%";
    tmpfsHugeMemoryPages = "within_size";
    useTmpfs = true;
  };
}
