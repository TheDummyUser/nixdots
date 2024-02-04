{ config, lib, pkgs, ... }:

{
  imports = [
    ./waybar
    ./hyprland
    ./dunst
    ./zathura
    ./eza
    ./starship

  ];
}
