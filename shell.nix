{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    nixFlakes

    python3
    python3Packages.pip
    python3Packages.setuptools
    git
    yosys
    nextpnr
    trellis
    (sbt.override { jre = openjdk11; })
    pkgsCross.riscv64.buildPackages.gcc
  ];
}
