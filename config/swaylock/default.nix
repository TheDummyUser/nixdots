{ config, lib, pkgs, ... }:

{
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
        image = "/mnt/Localdisk/folder/wall/0005.jpg";
      };
    };
  };
}
