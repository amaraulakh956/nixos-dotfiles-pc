{ inputs, config, pkgs, lib, system, ... }:


{
# Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.amar = {
    isNormalUser = true;
    description = "Amar Aulakh";
    extraGroups = [ "networkmanager" "wheel" "docker" "libvirtd"];
    packages = with pkgs; [
    #  thunderbird
    ];
  };
}