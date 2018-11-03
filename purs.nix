{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation rec {
  name = "purs-simple";
  version = "v0.12.0";
  platform = if pkgs.stdenv.targetPlatform.isMacOS
             then "macos"
             else "linux64";

  src = pkgs.fetchurl {
    url = "https://github.com/purescript/purescript/releases/download/${version}/${platform}.tar.gz";
    sha256 = "1wf7n5y8qsa0s2p0nb5q81ck6ajfyp9ijr72bf6j6bhc6pcpgmyc";
  };

  installPhase = ''
    mkdir -p $out/bin
    install -D -m555 -T purs $out/bin/purs
  '';
  }
