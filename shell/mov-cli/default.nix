{ lib, python3, fetchFromGitHub, writeShellScriptBin, }:
let
  src = fetchFromGitHub {
    owner = "mov-cli";
    repo = "mov-cli";
    rev = "47c453d156914c373f3ece05564d04f1e12c41e5";
    hash = "sha256-OJhZtrSB5rjPY80GkTSU82hkcBgFYpW7Rc24BlBH7CE=";
  };
in writeShellScriptBin "mov-cli" ''
  ${lib.getExe python3} ${src}/runner.py $@
''
