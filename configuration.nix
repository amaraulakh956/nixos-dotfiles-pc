# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, config, pkgs, lib, system, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
   
  
# ██████▄░▄█████░▄██████░██░░██░████████░▄█████▄░█████▄░▄██████
# ██░░░██░██░░░░░██░░░░░░██░░██░░░░██░░░░██░░░██░██░░██░██░░░░░
# ██░░░██░█████░░▀█████▄░█████░░░░░██░░░░██░░░██░█████▀░▀█████▄
# ██░░░██░██░░░░░░░░░░██░██░░██░░░░██░░░░██░░░██░██░░░░░░░░░░██
# ██████▀░▀█████░██████▀░██░░██░░░░██░░░░▀█████▀░██░░░░░██████▀
# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

      ./Desktops/niri.nix
      #./Desktops/xfce.nix
      #./Desktops/cinnamon.nix
      #./Desktops/gnome.nix
      #./Desktops/hyprland.nix
      ./Desktops/plasma.nix
    #  ./desktops/cosmic.nix
    ./Desktops/mangowm.nix
    ./Desktops/dwm.nix
    #./Desktops/i3.nix
    
  
# ▄██▄▄██▄░▄█████▄░██████▄░██░░░██░██░░░░░▄█████░▄██████
# ██░██░██░██░░░██░██░░░██░██░░░██░██░░░░░██░░░░░██░░░░░
# ██░██░██░██░░░██░██░░░██░██░░░██░██░░░░░█████░░▀█████▄
# ██░██░██░██░░░██░██░░░██░██░░░██░██░░░░░██░░░░░░░░░░██
# ██░██░██░▀█████▀░██████▀░▀█████▀░██████░▀█████░██████▀
# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
  

 ./Modules/packages.nix
  ./Modules/Audio.nix
   ./Modules/AuthenticationAgent.nix
    ./Modules/Bluetooth.nix
     ./Modules/Bootloaders.nix
      ./Modules/Docker.nix
       ./Modules/environment.nix
        ./Modules/flatpak.nix
         ./Modules/Gaming.nix
          ./Modules/gc.nix
           ./Modules/Kernel.nix
            ./Modules/Locale.nix
             ./Modules/Network.nix
              ./Modules/nix.nix
               ./Modules/Printing.nix
                ./Modules/Users.nix
                 ./Modules/Virtualization.nix
                  ./Modules/xdgPortal.nix
                  ./Modules/Greeters.nix
                  ./Modules/suckless.nix


   ./Config/openrgb.nix
    ];

  system.stateVersion = "26.05"; 

}
