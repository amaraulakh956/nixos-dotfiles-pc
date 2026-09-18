# nixos-dotfiles-pc

My NixOS flake configuration for my gaming PC — a modular setup covering desktop environments, system modules, and patched suckless tools, all built and switched with `nix flake`.

## System

- **Hostname:** `nixos`
- **Architecture:** `x86_64-linux`
- **Channel:** `nixos-unstable`
- **Bootloader:** GRUB (UEFI, removable install)
- **Kernel:** `linuxPackages_cachyos-bore`

## Structure

```
.
├── flake.nix                # Entry point — inputs and nixosConfigurations.nixos
├── flake.lock
├── configuration.nix         # Top-level config, imports everything below
├── hardware-configuration.nix
├── Desktops/                 # One file per DE/WM option, toggled via configuration.nix
│   ├── niri.nix               # active
│   ├── mangowm.nix             # active
│   ├── dwm.nix                  # active
│   ├── plasma.nix                # active
│   ├── xfce.nix, cinnamon.nix, gnome.nix, hyprland.nix, i3.nix, cosmic.nix   # available, commented out
├── Modules/                  # System-level config, one concern per file
│   ├── packages.nix, Audio.nix, Bluetooth.nix, Bootloaders.nix, Docker.nix
│   ├── Gaming.nix, Kernel.nix, Locale.nix, Network.nix, Printing.nix
│   ├── Users.nix, Virtualization.nix, environment.nix, flatpak.nix, gc.nix
│   ├── nix.nix, xdgPortal.nix, Greeters.nix, suckless.nix, AuthenticationAgent.nix
│   └── caddy-root.crt
└── Config/                   # Patched source for suckless tools + misc config
    ├── dwm/                    # Patched dwm source (vanitygaps, cfacts, fullscreen patches)
    ├── st/                     # Patched st (terminal) source
    ├── dmenu/                  # Patched dmenu source
    └── openrgb.nix
```

## Desktop environments

Multiple DEs/WMs are defined under `Desktops/` and toggled by (un)commenting their import in `configuration.nix`. Currently active: **Niri**, **mangowm**, **dwm**, and **Plasma**. The rest (XFCE, Cinnamon, GNOME, Hyprland, i3, COSMIC) are present but disabled for seamless swapping.

## Suckless tools

`dwm`, `st`, and `dmenu` are patched from source, built via `Modules/suckless.nix` using `overrideAttrs` to point at the local `Config/` sources rather than upstream. dwm patches include vanity gaps, cfacts, and an actual-fullscreen patch (see `Config/dwm/patches/`).

A `devShells.x86_64-linux.suckless` shell is provided in `flake.nix` with the build deps (`libX11`, `libXft`, `libXinerama`, `fontconfig`, `freetype`, `harfbuzz`, `gcc`, `gnumake`) for iterating on these locally with `nix develop .#suckless`.

## Flake inputs

Beyond `nixpkgs` (nixos-unstable): `niri-flake`, `noctalia-shell`, `quickshell`, `zen-browser`, a custom `Helium-Browser-flake` fork, `chaotic` (chaotic-nyx, for the CachyOS kernel/cache), `caelestia-shell`, and `mangowm`.

## Notable system config

- AMD GPU tuned with `amdgpu.ppfeaturemask=0xffffffff` and `amdgpu.dc_feature_mask=0x400` kernel params for overclocking and high refresh rate support
- `chaotic-nyx` binary cache enabled for faster CachyOS kernel builds
- `nix.settings.auto-optimise-store` and full core usage (`cores = 0`) for builds

## Usage

Clone and rebuild:

```bash
git clone https://github.com/amaraulakh956/nixos-dotfiles-pc.git ~/myflake
cd ~/myflake
sudo nixos-rebuild switch --flake .#nixos
```

Update flake inputs:

```bash
nix flake update
```

Enter the suckless dev shell (for building/patching dwm, st, dmenu):

```bash
nix develop .#suckless
```

## Notes

- `Config/dwm`, `Config/st`, and `Config/dmenu` are plain tracked directories, not git submodules — Nix's local flake source filter only sees files tracked directly in the top-level repo, so nested `.git` repos (submodules) get silently excluded from the build.
- `hardware-configuration.nix` is machine-specific and won't apply as-is to other hardware.
