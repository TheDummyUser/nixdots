{ config, lib, inputs, pkgs, ... }:
let nixvim = inputs.nixvim.packages.${pkgs.system}.default;
in {
  programs.nixvim = {
    enable = true;

    colorschemes.kanagawa.enable = true;
    plugins.lightline.enable = true;
  };
}
