{ pkgs, ...}:

# {
#   # Catppuccin Theme
#   gtk = {
#     enable = true;
#      theme = {
#       name = "Catppuccin-Mocha-Standard-Lavender-Dark";
#         package = pkgs.catppuccin-gtk.override {
#           accents = [ "lavender" ];
#           size = "standard";
#           tweaks = [ ];
#           variant = "mocha";
#         };
#       };
#       iconTheme = {
#         name = "kora";
#         package = pkgs.kora-icon-theme;
#       };
#       gtk3 = {
#         extraConfig = {
#           gtk-application-prefer-dark-theme = 1;
#         };
#       };
#       gtk4 = {
#         extraConfig = {
#           gtk-application-prefer-dark-theme = 1;
#         };
#       };
#     };
# }

{
# Dracula Theme 
home.pointerCursor = {
  gtk.enable = true;
    package = pkgs.vanilla-dmz;
    name = "Vanilla-DMZ";
  };

gtk = {
  enable = true;
   theme = {
    name = "Dracula";
      package = pkgs.dracula-theme;
    };
    iconTheme = {
      name = "Dracula";
      package = pkgs.dracula-icon-theme;
    };
    gtk3 = {
      extraConfig = {
        gtk-application-prefer-dark-theme = 1;
      };
    };
    gtk4 = {
      extraConfig = {
        gtk-application-prefer-dark-theme = 1;
      };
    };
  };  
  
qt = {
  enable = true;
    platformTheme = "gtk";
    style = {
      package = pkgs.adwaita-qt;
      name = "adwaita-dark";
    };
  };

}

