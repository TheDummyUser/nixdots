{ config, lib, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
      # font
      font_family = "JetBrainsMono Nerd Font";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      font_size = 12;

      #curosr
      cursor_spape = "block";

      scrollback_line = 2000;

      # bell
      enable_audio_bell = "no";
      window_alert_on_bell = "no";
      detect_url = "yes";
      url_style = "curly";
      url_prefixes =
        "file ftp ftps gemini git gopher http https irc ircs kitty mailto news sftp ssh";
      show_hyperlink_targets = "yes";
      underline_hyperlinks = "hover";
      confirm_os_window_close = 0;

      #border
      window_padding_width = 10;

      background = "#${config.colorScheme.colors.base00}";
      foreground = "#${config.colorScheme.colors.base05}";
      section_background = "#${config.colorScheme.colors.base00}";
      section_foreground = "#${config.colorScheme.colors.base05}";
      url_color = "#${config.colorScheme.colors.base04}";
      cursor = "#${config.colorScheme.colors.base05}";
      active_border_color = "#${config.colorScheme.colors.base03}";
      inactive_border_color = "#${config.colorScheme.colors.base01}";
      active_tab_backgroud = "#${config.colorScheme.colors.base00}";
      active_tab_foreground = "#${config.colorScheme.colors.base05}";
      inactive_tab_background = "#${config.colorScheme.colors.base01}";
      inactive_tab_foreground = "#${config.colorScheme.colors.base01}";
      tab_bar_background = "#${config.colorScheme.colors.base01}";

      # normal colors
      color0 = "#${config.colorScheme.colors.base00}";
      color1 = "#${config.colorScheme.colors.base08}";
      color2 = "#${config.colorScheme.colors.base0B}";
      color3 = "#${config.colorScheme.colors.base0A}";
      color4 = "#${config.colorScheme.colors.base0D}";
      color5 = "#${config.colorScheme.colors.base0E}";
      color6 = "#${config.colorScheme.colors.base0C}";
      color7 = "#${config.colorScheme.colors.base05}";

      # bright colors
      color8 = "#${config.colorScheme.colors.base03}";
      color9 = "#${config.colorScheme.colors.base08}";
      color10 = "#${config.colorScheme.colors.base0B}";
      color11 = "#${config.colorScheme.colors.base0A}";
      color12 = "#${config.colorScheme.colors.base0D}";
      color13 = "#${config.colorScheme.colors.base0E}";
      color14 = "#${config.colorScheme.colors.base0C}";
      color15 = "#${config.colorScheme.colors.base07}";

      # extended colors

      color16 = "#${config.colorScheme.colors.base09}";
      color17 = "#${config.colorScheme.colors.base0F}";
      color18 = "#${config.colorScheme.colors.base01}";
      color19 = "#${config.colorScheme.colors.base02}";
      color20 = "#${config.colorScheme.colors.base04}";
      color21 = "#${config.colorScheme.colors.base06}";

    };
  };
}
