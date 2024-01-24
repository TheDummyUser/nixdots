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
    };
  };
}
