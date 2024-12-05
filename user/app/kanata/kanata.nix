{ config, inputs, home, pkgs, ... }:

{
  home.packages = with pkgs; [
    kanata
  ];

  home.file.".config/kanata/".source = ./.;
}
