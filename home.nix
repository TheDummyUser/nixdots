{ lib, config, gtkThemeFromScheme, inputs, pkgs, ... }:
let
  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
  nixColors = inputs.nix-colors.packages.${pkgs.system}.default;

in {
  # home.packages = [ pkgs.obsidian ];
  # nixpkgs.config.permittedInsecurePackages = [ "electron-25.9.0" ];

  # main
  colorScheme = inputs.nix-colors.colorSchemes.horizon-dark;
  # configure spicetify :)
  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.Sleek;
    colorScheme = "BladeRunner";

    enabledExtensions = with spicePkgs.extensions; [
      fullAppDisplay
      shuffle # shuffle+ (special characters are sanitized out of ext names)
      hidePodcasts
      adblock
      playNext
    ];
  };

  gtk = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 9;
    };
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme.override { color = "yaru"; };
    };
    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 16;
    };
  };
  qt = {
    enable = true;
    platformTheme = "gtk";
    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt;
    };
  };

  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 22;
    gtk.enable = true;
    x11.enable = true;
  };
  programs.zsh = {
    enable = true;
    dotDir = "/etc";

    initExtra = ''
      eval "$(direnv hook zsh)"
    '';
  };

  #programs.eza = {
  #  enable = true;
  #  enableAliases = true;
  #};

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
  #imports

  imports = [ ./config ];

}
