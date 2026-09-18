{ inputs, config, pkgs, lib, system, ... }:

{
  security.pki.certificateFiles = [ ./caddy-root.crt ];
networking.nameservers = [ "100.64.0.2" ];

networking.firewall.extraCommands = ''
  iptables -I INPUT -s 172.19.0.0/24 -p tcp --dport 11434 -j ACCEPT
'';
networking.firewall.trustedInterfaces = [ "virbr0" ];

 networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  networking.networkmanager.enable = true;

  #tailscale
services.tailscale.enable = true;

}