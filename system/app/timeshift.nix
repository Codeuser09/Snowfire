{ config, lib, pkgs, ... }:

{
  environment.systemPackages = [pkgs.timeshift];
}
