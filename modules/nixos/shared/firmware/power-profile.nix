{
  # services.power-profiles-daemon.enable = true;
  services.tuned = {
    enable = true;
    ppdSupport = true;
    settings = {
      dynamic_tuning = true;
    };
    ppdSettings = {
      main = {
        default = "performance";
        battery_detection = false;
      };
    };
  };
}
