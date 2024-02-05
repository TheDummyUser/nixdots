{ stdenvNoCC, fetchFromGitHub, qtgraphicaleffects, }:
stdenvNoCC.mkDerivation {
  name = "sddm-chinese-painting-theme";

  src = fetchFromGitHub {
    owner = "fralonra";
    repo = "sddm-chinese-painting-theme";
    rev = "26b78cae632c7416378b454be836b82e1adbddd0";
    sha256 = "sha256-6lwxJW1f+xnNlydlcOw9C5Gn4TVUfT1ZS96cble7IDU=";
  };

  dontWrapQtApps = true;

  propagatedBuildInputs = [ qtgraphicaleffects ];

  installPhase = ''
    runHook preInstall

    mkdir -p "$out/share/sddm/themes/"
    cp -r chinese-painting "$out/share/sddm/themes/chinese-painting"

    runHook postInstall
  '';

  postFixup = ''
    mkdir -p $out/nix-support

    echo ${qtgraphicaleffects} >> $out/nix-support/propagated-user-env-packages
  '';
}
