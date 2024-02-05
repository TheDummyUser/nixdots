{ pkgs, ... }:
let sddmTheme = import ./astro.nix { inherit pkgs; };
in {
  services.xserver = {
    enable = true;
    displayManager = {
      sddm.enable = true;
      sddm.theme = "${sddmTheme}";
      #sddm.theme = "chinese-painting";
      sddm.settings = {
        cursorTheme = {
          name = "Bibata-Modern-Ice";
          size = 16;
        };
      };
    };
  };

  environment.systemPackages = with pkgs; [
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
    libsForQt5.qt5.qtsvg
    #(pkgs.libsForQt5.callPackage ./chinese-painting.nix { })
    #    #(pkgs.libsForQt5.callPackage ./astro.nix)
  ];
}
