{
  inputs,
  pkgs,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in {

  # configure spicetify :)
  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.Onepunch;
    colorScheme = "Legacy";

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
    iconTheme.package =  pkgs.papirus-icon-theme;
    iconTheme.name = "Papirus-Dark";
  };

  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 22;
    gtk.enable = true;
    x11.enable = true;
  };


  imports = [
    ./shell/foot.nix
  ];

}
