{ lib, stdenv, fetchFromGitHub, writeShellScriptBin, python3, }:
let
  src = fetchFromGitHub {
    owner = "limiteci";
    repo = "donut.c";
    rev = "605cc72f10bea86f7829bb3bdfe79374569ceb15";
    hash = "sha256-UA32oTOYEYQHpyodhEGAv4G6vpYzwSTeE+J1scO0n0Q=";
  };
in writeShellScriptBin "donut" ''
  ${lib.getExe python3} ${src}/donut.py $@
''
