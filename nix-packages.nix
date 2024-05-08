{pkgs, ...}: {
  # Allow Unfree Packages.
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    (callPackage ./modules/CodeCraft/lvim-gui.nix {})

    # DELL
    # dell-command-configure

    # DISK check
    gsmartcontrol
    gparted
    kdiskmark

    # Polkit
    # polkit_gnome

    # TPM
    tpm2-tools
    tpm2-tss

    # Filesystems
    xfsprogs
    e2fsprogs
    btrfs-progs

    # Sensors
    lm_sensors

    # # LVIM_DADDY / LunarnVim
    # neovide
    # lunarvim
    # gnumake
    # python3
    # nodejs
    # cargo
    # lazygit
    # wget
    # stylua
    # code-minimap
    # gcc
    # ripgrep
    # fd
    # prettierd
    # eslint_d
    # nodePackages_latest.live-server
    # nodePackages_latest.pnpm
    # typescript
    # nil
    # nixpkgs-fmt
    # nodePackages_latest.typescript-language-server
    # python311Packages.json5
    # python311Packages.pip
    # deno
    # imagemagick
    # luajitPackages.magick
    # luajitPackages.luarocks-nix
    # # bottom

    # Helix
    # helix
    # nodePackages_latest.typescript-language-server
    # vscode-langservers-extracted
    # deno

    # nodePackages_latest.coc-tsserver

    # QT
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct

    # SDDM
    libsForQt5.qtgraphicaleffects
    libsForQt5.qt5.qtsvg
    libsForQt5.qt5ct
    libsForQt5.qtquickcontrols2

    # File Manager
    cinnamon.nemo-with-extensions
    cinnamon.folder-color-switcher
    cinnamon.nemo-fileroller
    xdg-user-dirs

    # Wallpaper
    wpaperd
    mpvpaper
    swaylock-effects

    kitty
    alacritty
    neofetch
    rofi-wayland
    tofi
    wlogout
    yad
    # pavucontrol
    btop
    mako
    psmisc
    # dunst
    pamixer
    libnotify
    brightnessctl
    wl-clipboard
    cliphist
    wlroots
    slurp
    hyprpicker
    hyprshade
    imagemagick
    grim
    trash-cli
    viewnior
    lsd
    unzip
    ventoy-full
    motrix
    bashmount
    qbittorrent
    # linux-wifi-hotspot

    # Docker packages
    docker-compose

    # PipeWire Packages
    easyeffects
    pwvucontrol
    paprefs
    pavucontrol
    helvum
    pulseaudio

    # Video Player
    mpv

    # Browsers
    # librewolf
    # mullvad-browser

    # (vivaldi.override {
    #   proprietaryCodecs = true;
    #   enableWidevine = true;
    #   kerberosSupport = true;
    # })

    # OpenBangla
    # fcitx5-openbangla-keyboard
    # fcitx5-with-addons
    # fcitx5-configtool
    # fcitx5-gtk
    # fcitx5-nord

    # To run a windows app
    bottles

    # Localsend
    localsend

    # Cleanin software
    # stacer

    # Remote control
    # parsec-bin

    # Messaging apps
    # signal-desktop

    (discord.override {
      withOpenASAR = true;
      withVencord = true;
    })
  ];

  # Fonts for NIX-OS.
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    font-awesome
    noto-fonts-emoji
    lohit-fonts.bengali
    # julia-mono
    # monaspace

    # Nerd fonts
    (nerdfonts.override {fonts = ["FiraCode" "Iosevka"];})
  ];

  # # Latest mesa driver
  # chaotic.mesa-git = {
  #   enable = true;
  #   # extraPackages = with pkgs; [mesa_git.opencl];
  #   # extraPackages32 = with pkgs.pkgsi686Linux; [pkgs.mesa32_git.opencl];
  # };

  # # AMD-HDR
  # chaotic.hdr = {
  #   enable = true;
  #   # kernelPackages = pkgs.linuxKernel.packages.linux_hdr;
  # };

  # FLathub
  # services.flatpak.enable = true;

  # Media Servers
  services.plex = {
    enable = true;
    openFirewall = true;
    user = "username";
  };

  services = {
    jellyfin = {
      enable = true;
      openFirewall = true;
      user = "username";
    };
    jellyseerr.enable = true;
  };

  # Virtualbox
  # virtualisation.virtualbox.host.enable = true;
  # users.extraGroups.vboxusers.members = [ "username" ];
  # virtualisation.virtualbox.host.enableExtensionPack = true;

  # Android Studio
  programs.adb.enable = true;

  # Docker
  users.extraGroups.docker.members = ["username"];
  virtualisation.docker = {
    enable = true;
  };

  # Mullvad-VPN.
  # services.mullvad-vpn = {
  #   enable = true;
  #   package = pkgs.mullvad-vpn;
  # };

  # TeamViewer
  services.teamviewer.enable = true;

  # waydroid
  # virtualisation.waydroid.enable = true;
}
