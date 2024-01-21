{ config, lib, pkgs, ... }:

{
  programs = {
    zsh = {
      #loginShellInit = "wal -R";
      #extraConfig = "(wal -R)";
      interactiveShellInit =
        "(wal -R) && clear && pokemon-colorscripts -r --no-title";
      shellAliases = {
        ld = "eza --icons always -lD";
        lf = "eza --icons always -lF --color=always | grep -v /";
        lh = "eza --icons always -dl .* --group-directories-first";
        ll = "eza --icons always -al --group-directories-first";
        ls = "eza --icons always -alF --color=always --sort=size | grep -v /";
        lt = "eza --icons always -al --sort=modified";
        doom = "~/.config/emacs/bin/doom";
        update =
          "cd ~/minemine && sudo nixos-rebuild switch --flake .#default && cd ~/";
        ff = "clear && fastfetch";
        anime = "clear && ani-cli --vlc -q 1080p";
      };
      histSize = 10000;
      enable = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      ohMyZsh = {
        enable = true;
        theme = "gentoo";
      };
    };
  };
}
