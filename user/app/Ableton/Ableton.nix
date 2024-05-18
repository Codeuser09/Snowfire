{ config, pkgs, userSettings, ... }:

{
  home.packages = ([
    (pkgs.makeDesktopItem {
      name = "Ableton";
      desktopName = "Ableton";
      exec = "/home/simon/vmware/start.sh";
      terminal = false;
      type = "Application";
      mimeTypes = ["application/octet-stream"];
      icon = "/home/simon/vmware/Ableton.png";
    })
    (pkgs.makeDesktopItem {
      name = "Ableton (Fullscreen)";
      desktopName = "Ableton (Fullscreen)";
      exec = "/home/simon/vmware/start_fullscreen.sh";
      terminal = false;
      type = "Application";
      mimeTypes = ["application/octet-stream"];
      icon = "/home/simon/vmware/Ableton.png";
    })

  ]);
}
