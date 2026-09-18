{ inputs, config, pkgs, lib, system, ... }:

{
#boot.kernelPackages = pkgs.linuxPackages_latest;
#boot.kernelPackages = pkgs.linuxPackages_zen;
boot.kernelPackages = pkgs.linuxPackages_cachyos-bore;

nix.settings = {
  cores = 0;                # 0 = use all available cores
  max-jobs = "auto";
  substituters = [ "https://chaotic-nyx.cachix.org/" ];
  trusted-public-keys = [ "chaotic-nyx.cachix.org-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8=" ];
  auto-optimise-store = true;
  experimental-features = [ "nix-command" "flakes" ];
};

hardware.cpu.amd.updateMicrocode = true;

 boot.kernelParams = [
  "amdgpu.ppfeaturemask=0xffffffff"
  "amdgpu.dc_feature_mask=0x400"
];

services.xserver.videoDrivers = ["amdgpu"];

powerManagement.cpuFreqGovernor = "performance";

# Enable the X11 windowing system.
  services.xserver.enable = true;

}