{ inputs, config, pkgs, lib, system, ... }:

{

  environment.sessionVariables = {
  FLAKE= "/home/amar/myflake";
  STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "\${HOME}/.steam/root/compatibilitytools.d";
#  XDG_CURRENT_DESKTOP = "Hyprland";
#  XDG_SESSION_TYPE = "wayland";
};

environment.shellAliases = {
  rebuild = "sudo nixos-rebuild switch --flake /home/amar/myflake#nixos";
  #update = "sudo nix flake update && sudo nixos-rebuild switch --flake .#nixos";
  garbage = "sudo nix-collect-garbage";
  conservation = "echo 1 | sudo tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode";
  normal = "echo 0 | sudo tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode";
  refresh = "kbuildsycoca6";
  #lsfg-vk="~/lsfg-vk/ui/target/release/lsfg-vk-ui";
  nhb ="nh os boot ~/myflake";
  nhr = "nh os switch ~/myflake";
  nht = "nh os test ~/myflake";
  cliampj = "cliamp --provider jellyfin";
  update = "nh os boot ~/myflake --update && flatpak update";
  monitor = "xrandr --output DisplayPort-0 --mode 1920x1080 --rate 143.98 &&  feh --bg-fill ~/Pictures/1920x1200.png && ~/.local/bin/dwmstatus.sh &";
  };

environment.variables.QT_QPA_PLATFORMTHEME = lib.mkForce "qt6ct";
}
