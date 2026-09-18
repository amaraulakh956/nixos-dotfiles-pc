{ config, pkgs, callPackage, ... }: 

{
  
  services.xserver = {
    enable = true;

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu #application launcher most people use
        i3status # gives you the default i3 status bar
        i3lock #default i3 screen locker
     ];
    };
  };
}