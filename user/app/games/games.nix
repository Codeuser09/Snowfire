{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
   lutris
   heroic
  ];
}
