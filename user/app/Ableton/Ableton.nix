{ config, pkgs, userSettings, ... }:

{
  home.packages = ([
    (pkgs.makeDesktopItem {
      name = "Ableton";
      desktopName = "Ableton live 11";
      exec = "vmplayer /home/simon/vmware/Windows\ 10\ x64/Windows\ 10\ x64.vmx";
      terminal = false;
      type = "Application";
      mimeTypes = ["application/octet-stream"];
    })]);
}
