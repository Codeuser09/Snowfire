{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ virt-manager distrobox ];
  virtualisation.libvirtd = {
    allowedBridges = [
      "nm-bridge"
      "virbr0"
    ];
    enable = true;
    qemu.runAsRoot = true;
  };
  virtualisation.waydroid.enable = true;
  virtualisation.vmware.host.enable = true;
}
