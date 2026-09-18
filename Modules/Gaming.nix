{ inputs, config, pkgs, lib, system, ... }:

{

  #gaming
hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

#STEAM
programs.steam = {
  enable = true;
  remotePlay.openFirewall = true;
  dedicatedServer.openFirewall = true;
  localNetworkGameTransfers.openFirewall = true;
  gamescopeSession.enable = true;
};

programs.gamemode.enable = true;


}