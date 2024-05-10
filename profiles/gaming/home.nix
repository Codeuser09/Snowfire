{ config, pkgs, pkgs-kdenlive, nix-doom-emacs, stylix, userSettings, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = userSettings.username;
  home.homeDirectory = "/home/"+userSettings.username;

  programs.home-manager.enable = true;

  imports = [
              (if ((userSettings.editor == "emacs") || (userSettings.editor == "emacsclient")) then nix-doom-emacs.hmModule else null)
              stylix.homeManagerModules.stylix
              (./. + "../../../user/wm"+("/"+userSettings.wm+"/"+userSettings.wm)+".nix") # My window manager selected from flake
              ../../user/shell/sh.nix # My zsh and bash config
              ../../user/shell/cli-collection.nix # Useful CLI apps
              ../../user/bin/backup.nix
              ../../user/bin/phoenix.nix # My nix command wrapper
              ../../user/bin/rebuild.nix
              ../../user/bin/remove_old.nix
              ../../user/app/doom-emacs/doom.nix # My doom emacs config
              ../../user/app/ranger/ranger.nix # My ranger file manager config
              #../../user/app/git/git.nix # My git config
              #../../user/app/keepass/keepass.nix # My password manager
              (./. + "../../../user/app/browser"+("/"+userSettings.browser)+".nix") # My default browser selected from flake
              #../../user/app/flatpak/flatpak.nix # Flatpaks
              ../../user/style/stylix.nix # Styling and themes for my apps
              ../../user/lang/cc/cc.nix # C and C++ tools
              ../../user/lang/rust/rust.nix #Cargo and shit
              ../../user/lang/python/python-packages.nix #Python shit I need for cargo stuff
              ../../user/lang/python/python.nix
              #../../user/lang/godot/godot.nix # Game development
              #../../user/pkgs/blockbench.nix # Blockbench ## marked as insecure
              ../../user/hardware/bluetooth.nix # Bluetooth
              ../../user/app/games/games.nix
              ../../user/app/Ableton/Ableton.nix
              #../../user/app/neovim/nvim.nix
            ];

  home.stateVersion = "22.11"; # Please read the comment before changing.

  home.packages = (with pkgs; [
    # Core
    zsh
    alacritty
    #librewolf
    #brave
    #qutebrowser
    dmenu
    rofi
    git
    obsidian
    firefox
    bitwarden
    mate.atril
    xournalpp
    glib
    gnome.nautilus
    openvpn
    discord
    qalculate-gtk
    baobab
    thunderbird
    gimp
    krita
    inkscape
    musikcube
    vlc
    mpv
    yt-dlp
    thunderbird
    obs-studio
    ffmpeg
    nodePackages.typescript-language-server
    typescript
    (pkgs.writeScriptBin "kdenlive-accel" ''
      #!/bin/sh
      DRI_PRIME=0 kdenlive "$1"
    '')
    audacity
    gh
    texinfo
    libffi zlib
    nodePackages.ungit
  ]) ++ ([ pkgs-kdenlive.kdenlive ]);

  xdg.enable = true;
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    music = "${config.home.homeDirectory}/Media/Music";
    videos = "${config.home.homeDirectory}/Media/Videos";
    pictures = "${config.home.homeDirectory}/Media/Pictures";
    templates = "${config.home.homeDirectory}/Templates";
    download = "${config.home.homeDirectory}/Downloads";
    documents = "${config.home.homeDirectory}/Documents";
    desktop = null;
    publicShare = null;
    extraConfig = {
      XDG_DOTFILES_DIR = "${config.home.homeDirectory}/.dotfiles";
      #XDG_ARCHIVE_DIR = "${config.home.homeDirectory}/Archive";
      #XDG_VM_DIR = "${config.home.homeDirectory}/Machines";
      #XDG_ORG_DIR = "${config.home.homeDirectory}/Org";
      XDG_PODCAST_DIR = "${config.home.homeDirectory}/Media/Podcasts";
      XDG_BOOK_DIR = "${config.home.homeDirectory}/Media/Books";
      XDG_PROJECT_DIR = "${config.home.homeDirectory}/Projects";
    };
  };
  xdg.mime.enable = true;
  xdg.mimeApps.enable = true;

  home.sessionVariables = {
    EDITOR = userSettings.editor;
    SPAWNEDITOR = userSettings.spawnEditor;
    TERM = userSettings.term;
    BROWSER = userSettings.browser;
  };

}
