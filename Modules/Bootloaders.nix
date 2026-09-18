{ inputs, config, pkgs, lib, system, ... }:

{
  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = false;

  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    efiInstallAsRemovable = true; # Ensures BIOS/UEFI finds it easily
    device = "nodev";              # "nodev" is required for UEFI setups
  };

 


}