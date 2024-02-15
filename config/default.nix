{ config, lib, pkgs, ... }:

{
  #home.packages = [ (pkgs.callPackage ./spotify-tui { }) ];
  imports = [
    ./waybar
    ./hyprland
    ./dunst
    ./rofi
    ./zathura
    ./eza
    ./starship
    ./kitty
    ./git
    ./swaylock
    ./fzf
  ];
}
