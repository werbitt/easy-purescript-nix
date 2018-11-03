{ pkgs ? import <nixpkgs> {} }:

let
  version = "v0.12.0";
  tgt = {
          "x86_64-darwin" =
            { url = "https://github.com/purescript/purescript/releases/download/${version}/macos.tar.gz";
              sha256 = "0fnkj0b8ll159svz7gxsi0ph7dnf6ay5p14jikd983f7m65z5jfb";
            };

          "x86_64-linux" =
            { url = "https://github.com/purescript/purescript/releases/download/${version}/linux.tar.gz";
              sha256 = "1wf7n5y8qsa0s2p0nb5q81ck6ajfyp9ijr72bf6j6bhc6pcpgmyc";
            };
        }.${pkgs.stdenv.system};

in
pkgs.stdenv.mkDerivation rec {
  name = "purs-simple";


  src = pkgs.fetchurl {
    url = tgt.url;
    sha256 = tgt.sha256;
  };

  installPhase = ''
    mkdir -p $out/bin
      install -D -m555 -T purs $out/bin/purs
    '';
  }
