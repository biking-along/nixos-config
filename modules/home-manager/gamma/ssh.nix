{
  services.ssh-agent = {
    enable = true;
    enableFishIntegration = true;
  };
  services.ssh-tpm-agent = {
    enable = true;
  };
}
