{
  services.fstrim.enable = true;
  boot.tmp = {
    cleanOnBoot = true;
    tmpfsSize = "100%";
    tmpfsHugeMemoryPages = "within_size";
    useTmpfs = false;
  };
}
