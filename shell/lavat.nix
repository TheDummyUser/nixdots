{ lib, stdenv, fetchFromGitHub, }:
stdenv.mkDerivation rec {
  pname = "lavat";
  version = "2.1.0";

  src = fetchFromGitHub {
    owner = "AngelJumbo";
    repo = "lavat";
    rev = "v${version}";
    hash = "sha256-wGtuYgZS03gXYgdNdugGu/UlROQTrQ3C1inJ/aTUBKk=";
  };

  makeFlags = [ "DESTDIR=$(out)" "PREFIX=" ];

  meta = with lib; {
    description = "Lava lamp simulation using metaballs in the terminal";
    homepage = "https://github.com/AngelJumbo/lavat";
    license = licenses.mit;
    mainProgram = "lavat";
    platforms = platforms.all;
  };
}
