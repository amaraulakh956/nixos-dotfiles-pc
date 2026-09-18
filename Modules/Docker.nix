{ inputs, config, pkgs, lib, system, ... }:

{

  virtualisation.docker.enable = true;
  virtualisation.docker.enableOnBoot = true;
}