{ pkgs, ... }:

{
  environment.systemPackages = [ pkgs.prismlauncher pkgs.temurin-jre-bin-20 ];
}
