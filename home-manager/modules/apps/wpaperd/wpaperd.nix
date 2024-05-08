{
  programs.wpaperd = {
    enable = true;
    settings = {
      eDP-1 = {
        # path = "~/Pictures/wall-temp/";
        path = "/etc/nixos/home-manager/modules/apps/wpaperd/wallpapers/";
        # RUST_BACKTRACE = 1;
        # apply-shadow = true;
      };
      HDMI-A-1 = {
        # path = "~/Pictures/wall-temp/";
        path = "/etc/nixos/home-manager/modules/apps/wpaperd/wallpapers/";
        sorting = "descending";
      };
    };
  };
}
