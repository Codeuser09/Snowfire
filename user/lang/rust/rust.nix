{ pkgs, ... }:

{
  home.packages = with pkgs; [
      # Rust setup
      rustup
      jetbrains.rust-rover
      pkgsCross.mingw32.buildPackages.gcc
      pkgsCross.mingwW64.buildPackages.gcc
  ];
}
