{ inputs, config, pkgs, lib, system, ... }:

{
   services.displayManager.ly.enable = false;

    services.xserver.displayManager.lightdm.enable = false;

      services.displayManager.cosmic-greeter.enable = false;

       services.displayManager.gdm.enable = false;

       services.displayManager.sddm.enable = true;
}