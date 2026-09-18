{ inputs, config, pkgs, lib, system, ... }:

{
  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
  "librewolf-unwrapped-151.0.2-1"
  "librewolf-151.0.2-1"
"librewolf-bin-151.0.1-2"
"librewolf-bin-unwrapped-151.0.1-2"
 "electron-40.10.5"
];
}