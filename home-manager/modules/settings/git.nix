{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit
    (lib)
    mkEnableOption
    mkIf
    ;

  cfg = config.shit.git;
in {
  options.shit.git = {
    enable = mkEnableOption "git";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      git
      lazygit
    ];

    programs.git = rec {
      enable = true;
      userName = "Linux-DADDY";
      userEmail = "nahianadnan1234@duck.com";

      signing.key = config.home.homeDirectory + "/.ssh/id_ed25519";
      signing.signByDefault = true;

      extraConfig = {
        gpg.format = "ssh";
        pull.rebase = false;
      };
    };
  };
}
