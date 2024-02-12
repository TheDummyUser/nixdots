{ config, lib, pkgs, ... }:
let
  image = pkgs.fetchurl {
    url = "https://w.wallhaven.cc/full/7p/wallhaven-7po93e.png";
    sha256 = "sha256-3/i57uqUBZneFCBAw0Zj1qIleYbWSfhNaXvxFS9s2l0=";
  };
in {
  programs = {
    swaylock = {
      enable = true;
      settings = {
        color = "${config.colorScheme.colors.base05}";
        font = "JetBrainsMono Nerd Font";
        font-size = 24;
        indicator-idle-visible = false;
        indicator-radius = 100;
        show-failed-attempts = true;
        line-color = "${config.colorScheme.colors.base02}";
        image = "${image}";
      };
    };
  };
}
