# NixOS

This is a flake for my desktop and laptop/tablet; Gamma and Kappa. Gamma is a
x86-64 desktop gaming pc with and Intel CPU and an AMD GPU. Lambda is a
repurposed sff pc acting as part of a homelab. Kappa is a Microsoft Surface
Pro 8. The kappa configs are originally forked from
[IWander's](https://github.com/iwanders/nixos-surface) Surface Pro 9 config.
Omicron is wsl on a Surface Laptop.

## Useful links;

- [NixOS configuration options](https://nixos.org/manual/nixos/unstable/options)

## Useful Commands;

### Build top level:

To build the top level filesystem result

```
nix build .#nixosConfigurations.HOSTNAME.config.system.build.toplevel
```

When large local builds have to happen, add `-L` for logging and set the amount
of build cores;

```
NIX_BUILD_CORES=10 nix build .#nixosConfigurations.HOSTNANE.config.system.build.toplevel -L
```

Then, we can copy closure that with (assuming `rw` is in `trusted-users`):

```
nix copy --to "ssh://rw@HOSTNAME" ./result
```

### Actually switch to the new config

```
nixos-rebuild switch --flake .#HOSTNAME
```

### Build the recovery image

The `flake.nix` file has some custom settings for generating a recovery image
that includes this repository in the `/home/nixos/nixos-config/` path.

The USB image can be built with:

```
nix build .#nixosConfigurations.surfaceRecovery.config.system.build.isoImage --out-link recovery.priv.result -L
```

## Custom Option Modules

These options are overridable. Modules with the prefix all are enabled by
default, modules with the prefix workstation are made default by enabling the
parent module, they can still individually be overriden.

### NixOS Modules

- `modules.shared.all.firmware.envVars.enable`: Set universal environment
  variables.
- `modules.shared.all.firmware.locale.enable`: Set universal locale settings.
- `modules.shared.all.hardware.audio.enable`: Enable universal audio settings.
- `modules.shared.all.hardware.disk.enable`: Enable universal disk settings.
- `modules.shared.all.hardware.networking.enable`: Enable universal networking
  settings.
- `modules.shared.all.nix.home-manager.enable`: Enable universal home-manager
  module settings.
- `modules.shared.all.nix.nh.enable`: Enable universal nh settings
- `modules.shared.all.nix.nix.enable`: Enable universal nix settings.
- `modules.shared.all.nix.nvf.enable`: Enable nvf settings.
- `modules.shared.all.nix.stylix.enable`: Enable universal stylix settings.
- `modules.shared.all.nix.user.enable`: Enable universal user settings.
- `modules.shared.all.software.fonts.enable`: Enable universal font settings.
- `modules.shared.all.software.hideDesktopEntry.enable`: Enable universal
  settings to hide unnecessary desktop entries.
- `modules.shared.all.software.openssh.enable`: Enable universal openssh
  settings.
- `modules.shared.all.software.systemPkgs.enable`: Enable universal system
  packages.
- `modules.shared.all.software.xdg.enable`: Enable universal xdg settings
- `modules.shared.workstation.enable`: Enable options and settings specific to
  workstations
- `modules.shared.workstation.hardware.bluetooth.enable`: Enable bluetooth with
  settings for workstations
- `modules.shared.workstation.hardware.enable`: Enable hardware options and
  settings specific to my workstations.
- `modules.shared.workstation.hardware.printing.enable`: Enable printing with
  settings for workstations.
- `modules.shared.workstation.software.enable`: Enable systemwide software
  configs for workstations.
- `modules.shared.workstation.software.gaming.enable`: Enable steam with extras
  like proton-ge-bin
- `modules.shared.all.nix.agenix.enable`: Add agenix to system packages.

### Home Manager Modules

- `homeModules.shared.all.bat.enable`: Enable bat with extras.
- `homeModules.shared.all.btop.enable`: Enable btop with settings.
- `homeModules.shared.all.eza.enable`: Enable eza with settings.
- `homeModules.shared.all.fastfetch.enable`: Enable fastfetch with settings.
- `homeModules.shared.all.fish.enable`: Enable fish home module.
- `homeModules.shared.all.git.enable`: Enable git with settings.
- `homeModules.shared.all.home-manager.enable`: Enable home-manager with
  settings.
- `homeModules.shared.all.homePkgs.enable`: Enable the list of shared home
  packages.
- `homeModules.shared.all.lazygit.enable`: Enable lazygit.
- `homeModules.shared.all.nix-index.enable`: Enable nix-index.
- `homeModules.shared.all.nix-search.enable`: Enable nix-search-tv
- `homeModules.shared.all.shell.enable`: Enable home shell settings for all
  shells.
- `homeModules.shared.all.stylix.enable`: Enable stylix home settings.
- `homeModules.shared.all.yazi.enable`: Enable yazi with settings.
- `homeModules.shared.workstation.antigravity-cli.enable`: Enable
  antigravity-cli and export gemini api key to home session variable via agenix.
- `homeModules.shared.workstation.automount.enable`: Enable automounting
  inserted drives.
- `homeModules.shared.workstation.enable`: Enable home-manager workstation
  specific modules.
- `homeModules.shared.workstation.foliate.enable`: Enable ebook reader program.
- `homeModules.shared.workstation.gtk.enable`: Enable gtk theme settings.
- `homeModules.shared.workstation.hideHmDe.enable`: Enable the hiding of desktop
  entries for specific programs.
- `homeModules.shared.workstation.imv.enable`: Enable imv.
- `homeModules.shared.workstation.mpv.enable`: Enable mpv.
- `homeModules.shared.workstation.obsidian.enable`: Enable obsidian.
- `homeModules.shared.workstation.vesktop.enable`: Enable vesktop.
- `homeModules.shared.workstation.zathura.enable`: Enable zathura.
