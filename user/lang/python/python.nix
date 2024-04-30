{ pkgs, ... }:

{
  home.packages = with pkgs; [
      # Python setup
      # python3Full
      jetbrains.pycharm-community
      #imath
      #pystring
  ];
}
