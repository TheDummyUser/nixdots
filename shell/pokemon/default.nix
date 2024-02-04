{ lib, fetchFromGitLab, writeShellScriptBin, python3, }:
let
  src = fetchFromGitLab {
    owner = "phoneybadger";
    repo = "pokemon-colorscripts";
    rev = "0483c85b93362637bdd0632056ff986c07f30868";
    hash = "sha256-rj0qKYHCu9SyNsj1PZn1g7arjcHuIDGHwubZg/yJt7A=";
  };
in writeShellScriptBin "pokemon-colorscripts" ''
  ${lib.getExe python3} ${src}/pokemon-colorscripts.py $@
''
