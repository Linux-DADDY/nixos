{
  # nixConfig = {
  #   substituters = [
  #     # "https://hyprland.cachix.org"
  #     "https://nix-community.cachix.org"
  #     "https://cache.nixos.org"
  #   ];
  #   trusted-public-keys = [
  #     # "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
  #     "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
  #     "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
  #   ];
  # };

  description = "Flake for global config, Home-Manager, Secureboot, Unstable packages, hyprland and SDDM and more.";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    # chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.3.0";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # nur = {
    #   url = "github:nix-community/NUR";
    # };
    snowfall-lib = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # sddm-sugar-candy-nix = {
    #   url = "gitlab:Zhaith-Izaliel/sddm-sugar-candy-nix";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # hosts = {
    #   url = "github:StevenBlack/hosts";
    # };
    hyprland = {
      # url = "github:hyprwm/Hyprland";
      url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    };
    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    hyprlock.url = "github:hyprwm/hyprlock";
    hyprpaper.url = "github:hyprwm/hyprpaper";

    Hyprsome = {
      url = "github:sopa0/hyprsome";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprsplit = {
      url = "github:shezdy/hyprsplit";
    };
    split-monitor-workspaces = {
      url = "github:Duckonaut/split-monitor-workspaces";
      inputs.hyprland.follows = "hyprland";
    };
    Hyprspace = {
      url = "github:KZDKM/Hyprspace";
      inputs.hyprland.follows = "hyprland";
    };
    alejandra = {
      url = "github:kamadorueda/alejandra/3.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # nh = {
    #   url = "github:viperML/nh";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    # nur,
    # chaotic,
    lanzaboote,
    home-manager,
    # sddm-sugar-candy-nix,
    # hosts,
    split-monitor-workspaces,
    Hyprsome,
    hyprsplit,
    alejandra,
    ...
  } @ inputs:
  # let
  #   lib = inputs.snowfall-lib.mkLib {
  #     inherit inputs;
  #     src = ./.;
  #     snowfall = {
  #       root = ./nix;
  #       namespace = "my-workspace";
  #       meta = {
  #         name = "my-awesome-flake";
  #         title = "My Awesome Flake";
  #       };
  #     };
  #   };
  # in
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations.Linux-DADDY = nixpkgs.lib.nixosSystem rec {
      system = "x86_64-linux";
      specialArgs = {inherit nixpkgs-unstable;};
      specialArgs = {inherit inputs;};
      modules = [
        # Secureboot Module
        lanzaboote.nixosModules.lanzaboote

        # Alejandra nix formatter
        {
          environment.systemPackages = [alejandra.defaultPackage.${system}];
        }

        # HyprSome, MultiMonitor Workspace app for Hyprland
        {
          environment.systemPackages = [Hyprsome.packages.${system}.default];
        }

        # hyprsplit, MultiMonitor Workspace app for Hyprland
        {
          # environment.systemPackages = [hyprsplit.packages.${system}.default];
        }

        # Host Module, It will block the Ads, #BUG: Can broke some sites.
        # hosts.nixosModule
        {
          # networking.stevenBlackHosts.enable = true;
          # networking.stevenBlackHosts = {
          #   blockFakenews = true;
          #   blockGambling = true;
          #   blockPorn = true;
          #   blockSocial = true;
          # };
        }

        # # NUR, LIKE Arch's Aur.
        # nur.nixosModules.nur
        # # Install a package from NUR
        # ({config, ...}: {
        #   # environment.systemPackages = [config.nur.repos.mic92.hello-nur];
        # })
        # {nixpkgs.overlays = [nur.overlay];}
        # # Use a option from NUR
        # ({pkgs, ...}: let
        #   nur-no-pkgs = import nur {
        #     nurpkgs = import nixpkgs {system = "x86_64-linux";};
        #   };
        # in {
        #   # imports = [nur-no-pkgs.repos.iopq.modules.xraya];
        #   # services.xraya.enable = true;
        # })

        # NH Helper
        # inputs.nh.nixosModules.default
        # {programs.nh.package = inputs.nh.packages.x86_64-linux.default;}

        ({
          pkgs,
          lib,
          nixpkgs-unstable,
          ...
        }: let
          # Using unstable branch
          overlay-unstable = final: prev: {
            unstable = import nixpkgs-unstable {
              config.allowUnfree = true;
              inherit (final) system;
            };
          };
          # pkgs-unstable = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system}; ## I'm not sure about this, so i kept it.
          pkgs-unstable = inputs.nixpkgs-unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system};
        in {
          nixpkgs.overlays = [overlay-unstable];
          environment.systemPackages = with pkgs; [
            # Secure Boot
            pkgs.sbctl

            # browsers
            # unstable.mullvad-browser
            unstable.floorp

            # One app for almost all apps
            # unstable.franz
            unstable.rambox
            # unstable.ferdium

            # Messeging
            # unstable.signal-desktop
            unstable.beeper

            # unstable.anydesk

            (unstable.vivaldi.override {
              proprietaryCodecs = true;
              enableWidevine = true;
              kerberosSupport = true;
            })

            # LVIM_DADDY / LunarnVim
            unstable.neovide
            unstable.lunarvim
            unstable.gnumake
            unstable.python3
            unstable.nodejs
            unstable.cargo
            unstable.lazygit
            unstable.wget
            unstable.stylua
            unstable.code-minimap
            unstable.gcc
            unstable.ripgrep
            unstable.fd
            unstable.prettierd
            unstable.eslint_d
            unstable.nodePackages_latest.live-server
            unstable.nodePackages_latest.pnpm
            unstable.typescript
            unstable.nil
            unstable.nixpkgs-fmt
            unstable.nodePackages_latest.typescript-language-server
            unstable.python311Packages.json5
            unstable.python311Packages.pip
            unstable.deno
            unstable.imagemagick
            unstable.luajitPackages.magick
            unstable.luajitPackages.luarocks-nix
            # bottom

            # VPN
            unstable.protonvpn-gui
          ];

          # OPENGL from Unstable Branch.
          hardware.opengl = {
            package = pkgs-unstable.mesa.drivers;
            driSupport32Bit = true;
            package32 = pkgs-unstable.pkgsi686Linux.mesa.drivers;
          };

          # # NH Helper
          # nh = {
          #   enable = true;
          #   clean.enable = true;
          #   clean.extraArgs = "--keep-since 4d --keep 3";
          # };

          # programs.neovim = {
          #   enable = true;
          # };

          # systemd-boot with secureboot
          boot.loader.systemd-boot.enable = lib.mkForce false;
          boot.lanzaboote = {
            enable = true;
            pkiBundle = "/etc/secureboot";
          };
        })

        ./configuration.nix

        # chaotic.nixosModules.default

        # Home manager on flakes
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.username = {
              imports = [
                ./home-manager/home.nix
              ];
              wayland.windowManager.hyprland = {
                plugins = [
                  # inputs.Hyprspace.packages.${pkgs.system}.Hyprspace
                  # inputs.hyprsplit.packages.${pkgs.system}.hyprsplit
                  # inputs.split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces
                ];
              };
            };
          };
        }

        # # SDDM theme
        # sddm-sugar-candy-nix.nixosModules.default
        # {
        #   nixpkgs = {
        #     overlays = [
        #       sddm-sugar-candy-nix.overlays.default
        #     ];
        #   };
        # }
      ];
    };
  };
}
