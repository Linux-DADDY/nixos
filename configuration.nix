{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./nix-packages.nix
    ./zsh.nix
    ./desktop-environment.nix
    ./network-manager.nix
    ./mount-partitions.nix
    ./virt-manager.nix
    ./battery.nix
    # ./modules/CodeCraft/default.nix
    # ./modules/CodeCraft/lvim-gui.nix
  ];

  # Latest Linux kernel
  # boot.kernelPackages = pkgs.linuxPackages_latest;

  # Linux ZEN kernel
  # boot.kernelPackages = pkgs.linuxPackages_zen;

  # Linux Xanmod Stable Kernel
  # boot.kernelPackages = pkgs.linuxPackages_xanmod_stable;

  # linux cachyos kernel
  # boot.kernelPackages = pkgs.linuxPackages_cachyos;
  # environment.systemPackages = [pkgs.scx];

  # Kernel Modules and bootloader
  boot = {
    initrd = {
      kernelModules = ["amdgpu"];
    };
    kernelModules = ["kvm-amd"];
    # supportedFilesystems = ["ntfs"];
    consoleLogLevel = 0;
    kernelParams = [
      "video=eDP-1:1920x1080"
      "video=HDMI-A-1:1920x1080"
      "quiet"
      "splash"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      "boot.shell_on_fail"
    ];
    # SYSTEMD BOOT
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    # Plymouth
    initrd.enable = true;
    initrd.systemd.enable = true;
    plymouth = {
      enable = true;
      themePackages = [pkgs.catppuccin-plymouth];
      theme = "catppuccin-macchiato";
    };
    # Cleaning the /tmp
    # tmp.cleanOnBoot = true;
  };

  # TPM
  security.tpm2 = {
    enable = true;
    pkcs11 = {
      enable = true;
      package = pkgs.tpm2-pkcs11;
    };
    tctiEnvironment.enable = true;
    tssUser = "username";
  };

  # programs.nix-ld.enable = true;

  # Microcode
  hardware.cpu.amd.updateMicrocode = true;

  # System Hostname
  networking.hostName = "Linux-DADDY";

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  # Define a user account.
  users.users.username = {
    isNormalUser = true;
    extraGroups = ["wheel" "video" "input" "audio" "storage" "libvirtd"]; # "adbusers"
  };

  # Trim For SSD, fstrim.
  services.fstrim = {
    enable = true;
    interval = "weekly";
  };

  # Firmware updater
  services.fwupd = {enable = true;};

  # Wayland
  # environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # ETC
  # environment.etc = {
  #   "pipewire/pipewire.conf.d/92-low-latency.conf".text = ''
  #     context.properties = {
  #       default.clock.rate = 48000
  #       default.clock.quantum = 32
  #       default.clock.min-quantum = 32
  #       default.clock.max-quantum = 32
  #     }
  #   '';
  # };

  # Upowerd service
  services.upower = {
    enable = true;
    criticalPowerAction = "HybridSleep";
  };

  # Auto Suspend
  # services.autosuspend = {
  #   enable = true;
  #   settings = {
  #     enable = true;
  #     interval = 1;
  #     idle_time = 1;
  #   };
  # };

  # LoginD service
  services.logind = {
    lidSwitch = "suspend";
    extraConfig = ''
      HandlePowerKey=hybrid-sleep
    '';
  };

  # # Security
  # security = {
  #   polkit.enable = true;
  # };

  # Gnome polkit
  # systemd = {
  # user.services.polkit-gnome-authentication-agent-1 = {
  #   description = "polkit-gnome-authentication-agent-1";
  #   wantedBy = [ "graphical-session.target" ];
  #   wants = [ "graphical-session.target" ];
  #   after = [ "graphical-session.target" ];
  #   serviceConfig = {
  #       Type = "simple";
  #       ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
  #       Restart = "on-failure";
  #       RestartSec = 1;
  #       TimeoutStopSec = 10;
  #     };
  #   };
  # };

  # Sandbox
  nix.settings.sandbox = true;

  # Mouse support in virtual consoles
  services.gpm.enable = true;

  # Flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # ZramSwap
  zramSwap = {
    enable = true;
    memoryPercent = 40;
    algorithm = "zstd";
    priority = 10;
  };

  # # AUto mount drives
  # services.devmon.enable = true;
  # services.gvfs.enable = true;
  # services.udisks2.enable = true;

  # Auto system update.
  system.autoUpgrade = {
    enable = true;
    dates = "weekly";
    operation = "switch";
    # channel = "https://channels.nixos.org/nixos-23.11";
  };

  # Optimize NIX Store.
  nix.optimise = {automatic = true;};

  # Automatic Garbage Collection.
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # NixOS system details.
  system.stateVersion = "23.11";
}
