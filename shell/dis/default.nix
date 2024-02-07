{ lib
, rustPlatform
, fetchFromGitHub
}:

rustPlatform.buildRustPackage rec {
  pname = "display3d";
  version = "unstable-2024-02-06";

  src = fetchFromGitHub {
    owner = "redpenguinyt";
    repo = "display3d";
    rev = "b3fd8676b5978e9057bf3e6260954735c712c742";
    hash = "sha256-Updq9BC4X35hajjz3ocbgWPkitTO8b1HYFddsbwNg+0=";
  };

  cargoLock = {
    lockFile = ./Cargo.lock;
  };

  postPatch = ''
    ln -s ${./Cargo.lock} Cargo.lock
  '';

  meta = with lib; {
    description = "A command line interface to display and animate 3D objects";
    homepage = "https://github.com/redpenguinyt/display3d.git";
    license = licenses.unfree; # FIXME: nix-init did not found a license
    maintainers = with maintainers; [ ];
    mainProgram = "display3d";
  };
}
