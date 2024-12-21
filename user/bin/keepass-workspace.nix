{ pkgs, userSettings, ... }:
let myScript = ''
    while true; do
      hyprctl dispatch movetoworkspacesilent special:scratch_keepass,title:"No passwords here - KeePassXC"
      sleep 1
    done
    '';
in
{
  home.packages = [
    (pkgs.writeScriptBin "keepass-workspace" myScript)
  ];
}
