{ inputs, config, pkgs, lib, system, ... }:

{

hardware.bluetooth = {
  enable = true;
  powerOnBoot = false;
};

}