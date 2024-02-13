{ config, lib, pkgs, ... }:

{
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
