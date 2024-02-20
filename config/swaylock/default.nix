{ config, lib, pkgs, ... }:
let
  image = pkgs.fetchurl {
    url = "https://w.wallhaven.cc/full/3l/wallhaven-3lgo36.png";
    sha256 = "sha256-vNxXYLVMvOF4QxWwN/tcjQwWs9kZtahnm8Od6GjoPHQ=";
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
