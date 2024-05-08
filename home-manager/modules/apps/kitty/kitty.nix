{
  programs.kitty = {
    enable = true;
    font.name = "FantasqueSansM Nerd Font Mono Italic";
    font.size = 18;
    theme = "Catppuccin-Mocha";
    settings = {
      cursor_shape = "beam";
      cursor_beam_thickness = 1;
      cursor_underline_thickness = 2;
      cursor_blink_interval = -1;
      cursor_stop_blinking_after = 15;
      scrollback_lines = 10000;
      enable_audio_bell = false;
      update_check_interval = 0;
      mouse_hide_wait = 3;
      sync_to_monitor = true;
      window_padding_width = 10;
    };
  };
}
