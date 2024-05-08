let
  pkgs = import <nixpkgs> {};
in
  pkgs.callPackage ./lvim-gui.nix {}
