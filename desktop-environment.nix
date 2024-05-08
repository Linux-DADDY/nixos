{
  pkgs,
  lib,
  inputs,
  ...
}: {
  # # DE
  # services.xserver = {
  #   enable = true;
  #   # videoDrivers = [
  #   #   "amdgpu"
  #   # ];
  #   displayManager.sddm = {
  #     # wayland.enable = true;
  #     # settings = {
  #     #   Autologin = {
  #     #     Session = "hyprland.desktop";
  #     #     User = "username";
  #     #   };
  #     # };
  #     autoNumlock = true;
  #     sugarCandyNix = {
  #       enable = true;
  #       settings = {
  #         Background = lib.cleanSource ./sddm-wallpapers/wp13122300.png;
  #         ScreenWidth = 1920;
  #         ScreenHeight = 1080;
  #         FormPosition = "left";
  #         HaveFormBackground = true;
  #         PartialBlur = true;
  #         MainColor = "#cdd6f4";
  #         AccentColor = "#89dceb";
  #       };
  #     };
  #   };
  # };

  # Hyprland.
  programs = {
    waybar.enable = true;
    hyprland = {
      enable = true;
      xwayland.enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    };
  };

  # Vulkan
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      amdvlk
      vulkan-loader
      vulkan-validation-layers
      vulkan-extension-layer
    ];
    extraPackages32 = with pkgs; [
      driversi686Linux.amdvlk
    ];
  };

  # XDG Portal.
  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        # xdg-desktop-portal-hyprland
        # xdg-desktop-portal-gnome
        # xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
      ];
    };
  };

  # Swaylock
  security.pam.services.swaylock.text = ''
    auth include login
  '';

  # Dconf
  programs.dconf.enable = true;

  # security
  services.gnome.gnome-keyring.enable = true;
  programs.gnupg.agent = {
    enable = true;
    # enableSSHSupport = true;
  };

  # Dbus
  services.dbus.enable = true;

  # services Accounts
  services.accounts-daemon.enable = true;

  # Bluetooth support
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;
  hardware.bluetooth.settings = {
    General = {
      Enable = "Source,Sink,Media,Socket";
      Experimental = true;
    };
  };

  # Enable sound with pipewire.
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  # Pulseaudio
  # hardware.pulseaudio.enable = true;
  # hardware.pulseaudio.support32Bit = true;    ## If compatibility with 32-bit applications is desired.

  # Gnome
  #  services.xserver.desktopManager.gnome.enable = true;
  #   environment.gnome.excludePackages = (with pkgs; [
  #     gnome-photos
  #     gnome-tour
  #   ]) ++ (with pkgs.gnome; [
  #     cheese # webcam tool
  #     gnome-music # music player
  #     gnome-terminal # gnome terminal
  #     gedit # text editor
  #     epiphany # web browser
  #     geary # email reader
  #     evince # document viewer
  #     gnome-characters
  #     totem # video player
  #     tali # poker game
  #     iagno # go game
  #     hitori # sudoku game
  #     atomix # puzzle game
  # ]);

  # KDE/plasma
  # services.xserver.desktopManager.plasma5.enable = true;
  # environment.plasma5.excludePackages = with pkgs.libsForQt5; [
  #   elisa
  #   gwenview
  #   okular
  #   oxygen
  #   khelpcenter
  #   print-manager
  # ];
}
