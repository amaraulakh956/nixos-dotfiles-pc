{  pkgs, ... }:

{
    services.hardware.openrgb.enable = true;
     services.hardware.openrgb.package = pkgs.openrgb-with-all-plugins;
     #services.hardware.openrgb.motherboard = amd;
}