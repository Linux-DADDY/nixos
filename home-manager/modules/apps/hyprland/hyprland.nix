{ config, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = {
      monitor = [
        "monitor=eDP-1,1920x1080,0x0,1"
      ];
      input = {
        follow_mouse = 1;
        natural_scroll = 0;
        force_no_accel = 0;
      };
      gestures = {
        workspace_swipe = 1;
        workspace_swipe_fingers = 3;
        workspace_swipe_distance = 200;
        workspace_swipe_min_speed_to_force = 100;
      };
      general = {
        max_fps = 60;
        sensitivity = 1.0;
        apply_sens_to_raw = 0;
        gaps_in = 5;
        gaps_out = 10;
        border_size = 3;
        no_border_on_floating = 1;
        col.active_border = "0xFF56B6C2";
        col.inactive_border = "0xFF343A40";
      };
      decoration = {
        rounding = 10;
        # inactive_opacity = 0.90;
        # active_opacity = 0.90;
        drop_shadow = false;
        # shadow_range = 2;
        # shadow_render_power = 2;
        # col.shadow = rgba(1a1a1aee);
        blur = {
          enabled = false;
          size = 10;
          passes = 1;
          new_optimizations = true;
        };
      };
      animations = {
        enabled = "yes";
        bezier = {
          myBezier = "0.455, 0.03, 0.515, 0.955";
          myBezier-out = "0.55, 0.085, 0.68, 0.53";
        };
        animation = {
          windows = "1, 9, default";
          windowsOut = "1, 9, myBezier-out, popin 90%";
          border = "1, 9, default";
          fade = "1, 9, default";
          workspaces = "1, 9, myBezier";
        };
      };
      dwindle = {
        no_gaps_when_only = false;
        force_split = 0;
        special_scale_factor = 0.8;
        split_width_multiplier = 1.0;
        use_active_for_splits = true;
        pseudotile = "yes";
        preserve_split = "yes";
      };
      master = {
        special_scale_factor = 0.8;
        new_is_master = true;
        no_gaps_when_only = false;
      };
      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        mouse_move_enables_dpms = true;
        vfr = false;
        vrr = 0;
        animate_manual_resizes = true;
        mouse_move_focuses_monitor = true;
        enable_swallow = true;
        new_window_takes_over_fullscreen = 2;
        # force_hypr_chan = true;
      };
      windowrulev2 = [
        "float, class:^(Tor Browser)$"
        "float, class:^(Mullvad Browser)$"
        "float, class:^(kitty)$"
        "float, class:^(mpv)$"
        "float, class:^(imv)$"
        "float, class:^(Vieb)$"
        "float, title:^(Picture-in-Picture)$"
        "float, title:^(.*)(Choose User Profile)(.*)$"
        "float, title:^(blob:null/)(.*)$"

        "float, class:^(xdg-desktop-portal-gtk)$"
        # "opacity 0.8: ^(kitty)"
        "float, class:^(kitty), title: ^(Open*)"
        "size 50% 50%:^(kitty), title: ^(Open*)"
        "size 50% 50%:^(mpv), title: ^(Open*)"
      ];
      bindm = [
        "SUPER,mouse:272,movewindow"
        "SUPER,mouse:273,resizewindow"
      ];
      bind = [
        # Variables
        "$term = ~/.config/hypr/scripts/terminal"
        "$launcher= ~/.config/hypr/rofi/bin/launcher"
        # $clipboard = ~/.config/hypr/rofi/bin/clipboard
        "$powermenu= ~/.config/hypr/rofi/bin/powermenu"
        "$screenshot = ~/.config/hypr/rofi/bin/screenshot"
        "$colorpicker = ~/.config/hypr/scripts/colorpicker"
        "$volume = ~/.config/hypr/scripts/volume"
        # $brightness = ~/.config/hypr/scripts/brightness
        "$screenlock = ~/.config/hypr/scripts/lockscreen"

        #Hyprland keybinds
        "SUPER,c,killactive"
        "SUPER,F,fullscreen"
        "SUPER,SPACE,togglefloating, active"
        "SUPERSHIFT,C,centerwindow"
        "SUPERSHIFT,Q,exec,pkill Hyprland"
        "SUPERSHIFT,M,workspaceopt,allpseudo"
        "SUPER,TAB,cyclenext"
        "SUPER,TAB,bringactivetotop"

        # workspaces
        "SUPER,1,workspace,1"
        "SUPER,2,workspace,2"
        "SUPER,3,workspace,3"
        "SUPER,4,workspace,4"
        "SUPER,5,workspace,5"
        "SUPER,6,workspace,6"
        "SUPER,7,workspace,7"
        "SUPER,8,workspace,8"
        "SUPER,9,workspace,9"

        # Send to Workspaces
        "SUPERSHIFT,1,movetoworkspace,1"
        "SUPERSHIFT,2,movetoworkspace,2"
        "SUPERSHIFT,3,movetoworkspace,3"
        "SUPERSHIFT,4,movetoworkspace,4"
        "SUPERSHIFT,5,movetoworkspace,5"
        "SUPERSHIFT,6,movetoworkspace,6"
        "SUPERSHIFT,7,movetoworkspace,7"
        "SUPERSHIFT,8,movetoworkspace,8"
        "SUPERSHIFT,9,movetoworkspace,9"

        # -- Apps --
        "SUPERSHIFT,F,exec,nemo"
        # SUPERSHIFT,E,exec,$editor
        "SUPERSHIFT,W,exec,vivaldi"
        "SUPERSHIFT,E,exec,geany"

        # -- Rofi --
        "SUPER,D,exec,$launcher"
        "SUPERSHIFT,C,exec,$clipboard"
        "SUPER,X,exec,$powermenu"
        "SUPER,S,exec,$screenshot"

        # -- Function keys --
        "$scriptsDir = $HOME/.config/hypr/scripts"
        "$backlight = $scriptsDir/brightness"
        "$kbacklight = $scriptsDir/brightness-kbd"

        # Color picker
        "bind=SUPERSHIFT,P,exec,$colorpicker"

        # Focus
        "SUPER,left,movefocus,l"
        "SUPER,right,movefocus,r"
        "SUPER,up,movefocus,u"
        "SUPER,down,movefocus,d"

        # Move
        "SUPERSHIFT,left,movewindow,l"
        "SUPERSHIFT,right,movewindow,r"
        "SUPERSHIFT,up,movewindow,u"
        "SUPERSHIFT,down,movewindow,d"

        # Resize
        "SUPERCTRL,left,resizeactive,-20 0"
        "SUPERCTRL,right,resizeactive,20 0"
        "SUPERCTRL,up,resizeactive,0 -20"
        "SUPERCTRL,down,resizeactive,0 20"

        #-- Startup ----------------------------------------------------
        "exec-once=~/.config/hypr/scripts/startup"
        # exec-once=systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
        # exec-once=mpvpaper -o "no-audio --loop-playlist shuffle" '*' Videos/video-wallpapers/
        "exec-once = dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "exec-once = systemctl --user import-environment"
        "exec = hyprshade on vibrance"
        "exec-once = wpaperd"
        # exec-once = /nix/store/3pwaa0b6hc4ycqnrfkd89awa36kx85s2-polkit-kde-agent-1-5.27.10
        # exec-once = /nix/store/$(ls -la /nix/store | grep polkit-kde-agent | grep '^d' | awk '{print $9}')/libexec/polkit-kde-authentication-agent-1 & 
        # AutoStart Apps
        # exec-once=[workspace 1 silent] kitty
        # exec-once=[workspace 2 silent] vivaldi
        "exec-once=[workspace 3 silent] nemo"
        "exec-once=[workspace 2 silent] floorp"
        "exec-once=[workspace 4 silent] beeper"
        "exec-once=[workspace 9 silent] rambox"
        # exec-once=[workspace 7 silent] qbittorrent

      ];
    };
  };
}
