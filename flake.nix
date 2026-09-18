{
  description = "My NixOS flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    niri.url = "github:sodiboo/niri-flake";
    niri.inputs.nixpkgs.follows = "nixpkgs";
    niri.inputs.nixpkgs-stable.follows = "nixpkgs";
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    helium.url = "github:amaraulakh956/Helium-Browser-flake";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mangowm = {
      url = "github:mangowm/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, niri,  zen-browser, mangowm, chaotic, caelestia-shell, ... } @ inputs:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in
  {
    devShells.${system}.suckless = pkgs.mkShell {
      packages = with pkgs; [
        pkg-config
        xorg.libX11
        xorg.libXft
        xorg.libXinerama
        fontconfig
        freetype
        harfbuzz
        gcc
        gnumake
      ];
    };

    packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;
    packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        mangowm.nixosModules.mango
        niri.nixosModules.niri
        chaotic.nixosModules.default
        ./configuration.nix
        ({ pkgs, ... }: {
          nixpkgs.overlays = [
            (final: prev: { })
          ];
        })
      ];
    };
  };
}
