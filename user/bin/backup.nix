
{ pkgs, userSettings, ... }:

let
  myBackupScript = ''
  #!/usr/bin/env bash

  # A script to perform incremental backups using rsync

  set -o errexit
  set -o nounset
  set -o pipefail

  readonly SOURCE_DIR="$HOME"
  readonly BACKUP_DIR="/mnt/home_backups"
  readonly DATETIME="$(date '+%Y-%m-%d_%H:%M:%S')"
  readonly BACKUP_PATH="$BACKUP_DIR/$DATETIME"
  readonly LATEST_LINK="$BACKUP_DIR/latest"

  lsblk
  read -p "Is /dev/sda the correct backup drive? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1


  if grep -qs '/mnt/sda ' /proc/mounts; then
      sudo umount /dev/sda
  else
      echo "Not currently mounted"
  fi

  sudo mount /dev/sda2 /mnt
  mkdir -p "$BACKUP_DIR"

  rsync -av --delete \
    "$SOURCE_DIR/" \
    --link-dest "$LATEST_LINK" \
    --exclude=".cache" \
    "$BACKUP_PATH"

  rm -rf "$LATEST_LINK"
  ln -s "$BACKUP_PATH" "$LATEST_LINK"
    '';
in
{
  home.packages = [
    (pkgs.writeScriptBin "backup" myBackupScript)
  ];
}
