{ config, lib, pkgs, ... }:

{

  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        font = "JetBrains Mono:size=12";
        pad = "10x10";
        term = "foot";
      };
      scrollback = {
        lines = 2000;
        indicator-position = "none";
      };
      cursor = {
        style = "beam";
        blink = "yes";
        beam-thickness = 1.5;
      };
      bell = {
        urgent = "no";
        notify = "no";
        visual = "no";
      };
      url = { launch = "xdg-open \${url}"; };
      key-bindings = {
        scrollback-up-page = "Shift+Page_Up";
        scrollback-down-page = "Shift+Page_Down";
      };
      colors = {
        alpha = 1.0;
        background = "0x${config.colorScheme.colors.base00}";
        foreground = "0x${config.colorScheme.colors.base05}";

        ## Normal/regular colors (color palette 0-7)

        regular0 = "0x${config.colorScheme.colors.base00}"; # black
        regular1 = "0x${config.colorScheme.colors.base08}"; # red
        regular2 = "0x${config.colorScheme.colors.base0B}"; # green
        regular3 = "0x${config.colorScheme.colors.base0A}"; # yellow
        regular4 = "0x${config.colorScheme.colors.base0D}"; # blue
        regular5 = "0x${config.colorScheme.colors.base0E}"; # magenta
        regular6 = "0x${config.colorScheme.colors.base0C}"; # cyan
        regular7 = "0x${config.colorScheme.colors.base05}"; # white

        ## Bright colors (color palette 8-15)
        bright0 =
          "0x${config.colorScheme.colors.base00}"; # bright0=616161   # bright black
        bright1 =
          "0x${config.colorScheme.colors.base09}"; # bright1=ff4d51   # bright red
        bright2 = "0x${config.colorScheme.colors.base0B}"; # bright green
        bright3 = "0x${config.colorScheme.colors.base0A}"; # bright yellow
        bright4 = "0x${config.colorScheme.colors.base0D}"; # bright blue
        bright5 = "0x${config.colorScheme.colors.base02}"; # bright magenta
        bright6 = "0x${config.colorScheme.colors.base0C}"; # bright cyan
        bright7 = "0xffffff"; # bright white

      };
    };
  };
}
