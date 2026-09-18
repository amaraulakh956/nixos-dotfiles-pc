{ config, pkgs, ... }:

{

services.xserver.displayManager.lightdm.enable = false;
services.xserver.desktopManager.xfce.enable = true;
}
