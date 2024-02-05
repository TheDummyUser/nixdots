{ stdenvNoCC, fetchFromGitHub, qtgraphicaleffects, }:
stdenvNoCC.mkDerivation {
  name = "corners-sddm-theme";

  src = fetchFromGitHub {
    owner = "aczw";
    repo = "sddm-theme-corners";
    rev = "6ff0ff455261badcae36cd7d151a34479f157a3c";
    sha256 = "sha256-CPK3kbc8lroPU8MAeNP8JSStzDCKCvAHhj6yQ1fWKkY=";
  };

  dontWrapQtApps = true;

  propagatedBuildInputs = [ qtgraphicaleffects ];

  installPhase = ''
    runHook preInstall

    mkdir -p "$out/share/sddm/themes/"
    cp -r corners/ "$out/share/sddm/themes/corners"

    runHook postInstall
  '';

  postFixup = ''
    mkdir -p $out/nix-support

    echo ${qtgraphicaleffects} >> $out/nix-support/propagated-user-env-packages
  '';
}
