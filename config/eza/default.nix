{ config, lib, pkgs, ... }:

{
  programs.eza = {
    enable = true;
    enableAliases = true;
    icons = true;
    extraOptions = ["--group-directories-first" "--header" "--octal-permissions"];
};

}
