{
  services.auto-cpufreq = {
    enable = true;
    settings = {
      charger = {
        governor = "performance";
        energy_performance_preference = "performance";
        energy_perf_bias = "performance";
        platform_profile = "performance";
        turbo = "auto";
      };
      battery = {
        governor = "balanced";
        energy_performance_preference = "power";
        energy_perf_bias = "balance_power";
        platform_profile = "balanced";
        turbo = "never";
      };
    };
  };
  services.power-profiles-daemon.enable = false;
}
