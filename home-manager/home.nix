{
  config,
  pkgs,
  libs,
  ...
}: {
  imports = [
    ./modules/settings/theme.nix
    # ./modules/apps/firefox/firefox.nix
    # ./modules/settings/git.nix
    # ./modules/test/firefox.nix
    ./modules/apps/kitty/kitty.nix
    ./modules/apps/wpaperd/wpaperd.nix
    ./modules/apps/btop/btop.nix
    # ./modules/apps/hyprland/hyprland.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "username";
  home.homeDirectory = "/home/username";

  # Manage Dotfiles
  home.file = {};

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Dconfig
  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };

  # Github Support
  programs.git = {
    enable = true;
    userName = "Linux-DADDY";
    userEmail = "";

    signing.key = config.home.homeDirectory + "/.ssh/id_ed25519";
    signing.signByDefault = true;

    extraConfig = {
      gpg.format = "ssh";
      pull.rebase = false;
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # Auto Upgrade
  services.home-manager.autoUpgrade.enable = true;
  services.home-manager.autoUpgrade.frequency = "weekly";

  # HM Release
  home.stateVersion = "23.11";
}
