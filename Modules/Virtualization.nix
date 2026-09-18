{ inputs, config, pkgs, lib, system, ... }:

{
virtualisation.waydroid.enable = true;

  # Newer kernel versions may need
  virtualisation.waydroid.package = pkgs.waydroid-nftables;

virtualisation.libvirtd.enable = true;

programs.virt-manager.enable = true;

}