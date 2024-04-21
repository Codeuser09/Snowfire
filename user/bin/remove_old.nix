{ pkgs, userSettings, ... }:

let
  myRemoveOldScript = ''
  #!/usr/bin/env sh

  sudo nix-collect-garbage -d
  sudo /run/current-system/bin/switch-to-configuration boot
  '';
in
{
  home.packages = [
    (pkgs.writeScriptsBin "remove_old" myRemoveOldScript)
  ];
}
