{ pkgs }:
let
  image = pkgs.fetchurl {
    url =
      "https://raw.githubusercontent.com/Goxore/dotfiles/50db864d56d49768f1d4d0a8c1bd7a5c74dd629e/home/Wallpapers/tokyonight-crystal.png";
    sha256 = "sha256-fGEqdop2l+lEb5UL3m8YVtZRHwmVd5YhSKk1CIS+E6Q=";
  };
in pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = pkgs.fetchFromGitHub {
    owner = "MarianArlt";
    repo = "sddm-sugar-dark";
    rev = "ceb2c455663429be03ba62d9f898c571650ef7fe";
    sha256 = "0153z1kylbhc9d12nxy9vpn0spxgrhgy36wy37pk6ysq7akaqlvy";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
    cd $out/
    rm Background.jpg
    cp -r ${image} $out/Background.jpg
  '';
}
