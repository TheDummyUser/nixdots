{ inputs, pkgs, ... }:
let
  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
  nixColors = inputs.nix-colors.packages.${pkgs.system}.default;
in {
  colorScheme = inputs.nix-colors.colorSchemes.tomorrow-night;
  # configure spicetify :)
  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.Dribbblish;
    colorScheme = "Lunar";

    enabledExtensions = with spicePkgs.extensions; [
      fullAppDisplay
      shuffle # shuffle+ (special characters are sanitized out of ext names)
      hidePodcasts
      adblock
    ];
  };

  gtk = {
    enable = true;
    # cursorTheme.package = pkgs.bibata-cursors;
    # cursorTheme.name = "Bibata-Modern-Ice";
    font.name = "JetBrains Mono";
    theme.package = pkgs.vimix-gtk-themes;
    theme.name = "vimix-dark-doder";
    iconTheme.package = pkgs.papirus-icon-theme;
    iconTheme.name = "Papirus-Dark";
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

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
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

  imports = [
    ./shell/starship.nix
    ./shell/eza.nix # eza
    #./shell/foot.nix # foot
    ./shell/git.nix

    # config
    ./config/zathura.nix
    ./config/dunst.nix
    ./config/kitty.nix
  ];

}
