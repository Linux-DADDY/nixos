{
  # Power Management tool
  powerManagement.enable = true;

  # Battery Optimizations
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT1 = "conservative";

      CPU_ENERGY_PERF_POLICY_ON_BAT1 = "balance_power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";

      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT1 = 0;
      CPU_MAX_PERF_ON_BAT1 = 20;

      # USB_AUTOSUSPEND = 0;

      #Optional helps save long term battery health
      # START_CHARGE_THRESH_BAT1 = 25; # 40 and bellow it starts to charge
      # STOP_CHARGE_THRESH_BAT1 = 85; # 80 and above it stops charging
    };
  };

  # Better scheduling for CPU cycles - thanks System76!!!
  services.system76-scheduler.settings.cfsProfiles.enable = true;

  # Enable powertop
  powerManagement.powertop.enable = true;

  # Disable GNOMEs power management
  # services.power-profiles-daemon.enable = false;

  # Governor
  # powerManagement.cpuFreqGovernor = "powersave";
}
