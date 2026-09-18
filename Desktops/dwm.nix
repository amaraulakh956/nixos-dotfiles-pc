{ pkgs, ... }:
{
  services.xserver = {
    enable = true;
    autoRepeatDelay = 400;
    autoRepeatInterval = 60;
    windowManager.dwm = {
      enable = true;
      package = pkgs.dwm.overrideAttrs (old: {
        src = ../Config/dwm;
      });
    };
  };
}
