{ inputs, config, pkgs, lib, system, ... }:

{
  nix.gc = {
  automatic = true;
  dates = "weekly";
  options = "--delete-older-than 7d";
};
}