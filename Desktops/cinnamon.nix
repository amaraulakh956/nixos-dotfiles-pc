{ config, pkgs, ... }:

{
 services.xserver.desktopManager.cinnamon.enable = true;
 
 services.logind = {
    lidSwitch = "suspend";
    lidSwitchExternalPower = "suspend";
    settings.Login = {
      HandlePowerKey = "suspend";
      HandleSuspendKey = "suspend";
    };
  };
}