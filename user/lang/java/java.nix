{ pkgs, ... }:

{
  home.packages = with pkgs; [
      # Rust setup
      rustup
      jetbrains.intellij
  ];
}
