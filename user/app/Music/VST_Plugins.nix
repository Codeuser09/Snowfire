{ pkgs, ... }:

{
  home.packages = with pkgs; [
  surge-XT
  helm
  vital
  ];
}
