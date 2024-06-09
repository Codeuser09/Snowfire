{ pkgs, userSettings, ... }:

let
  myRebuildScript = ''
  #!/usr/bin/env bash
  cd ~/.dotfiles
  git add .
  git commit -m "Changed shit"
  git push origin main
  sudo nixos-rebuild switch --flake ~/.dotfiles#system
  nix run home-manager/master --extra-experimental-features nix-command --extra-experimental-features flakes -- switch --flake ~/.dotfiles#user
  '';
in
{
  home.packages = [
    (pkgs.writeScriptBin "rebuild" myRebuildScript)
  ];
}
