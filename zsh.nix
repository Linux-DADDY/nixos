{pkgs, ...}: {
  # ZSH with oh-my-zsh
  users.users.username = {
    shell = pkgs.zsh;
  };

  programs.zsh = {
    enable = true;
    ohMyZsh.enable = true;
    ohMyZsh.theme = "jonathan";

    # Zsh Config.
    histSize = 10000;
    histFile = "$HOME/.zsh_history";

    # Plugins
    syntaxHighlighting.enable = true;
    autosuggestions.strategy = ["history" "completion" "match_prev_cmd"];
    autosuggestions.highlightStyle = "fg=#50FA7B,bold";
    syntaxHighlighting.highlighters = ["main" "brackets" "pattern" "cursor" "regexp" "root" "line"];
    autosuggestions.enable = true;

    # Build in oh-my-zsh plugins
    ohMyZsh.plugins = ["sudo" "copyfile" "fd"];

    # Alias
    shellAliases = {
      # LSD
      ls = "lsd";
      ll = "lsd -l";

      # Useful Nix OS commands
      # edit = "sudo -E lvim /etc/nixos/configuration.nix";
      # edit-unstable = "sudo -E lvim /etc/nixos/unstable.nix";
      update = "sudo nix-channel --update && sudo nixos-rebuild switch --impure && home-manager switch --impure";

      # Trashy
      rm = "trash-put";
      list = "trash-list";
      restore = "trash restore";
      restore-all = "trash-restore ";
      remove-all = "trash-empty";

      # BashMount
      bm = "bashmount";

      # LunarVim
      delete-lvim = "sudo rm -rf .config/lvim && sudo rm -rf .local/share/lvim && sudo rm -rf .local/state/lvim && sudo rm -rf .cache/nvim && sudo rm -rf .local/share/nvim && sudo rm -rf .local/state/nvim";
    };
  };
}
