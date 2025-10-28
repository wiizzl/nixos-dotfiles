# nix-config

![Workflow status](https://github.com/wiizzl/nix-config/actions/workflows/flake-check.yml/badge.svg)
![Workflow status](https://github.com/wiizzl/nix-config/actions/workflows/flake-updater.yml/badge.svg)

This is my NixOS configuration files. Much inspired by configurations found online.

## TODO

- Secrets management with [sops-nix](https://github.com/Mic92/sops-nix)
- Darwin system modules

## Flake inputs

| Name                                                                             | Description                                                                        |
| :------------------------------------------------------------------------------- | :--------------------------------------------------------------------------------- |
| [nixpkgs](https://github.com/NixOS/nixpkgs/tree/nixos-unstable)                  | Unstable Nix package repository for the latest packages                            |
| [flake-parts](https://github.com/hercules-ci/flake-parts)                        | Simplify Nix Flakes with the module system packages                                |
| [home-manager](https://github.com/nix-community/home-manager/tree/release-25.05) | Manages user environments declaratively                                            |
| [nix-darwin](https://github.com/LnL7/nix-darwin)                                 | Nix-based configuration management for macOS                                       |
| [sops-nix](https://github.com/Mic92/sops-nix)                                    | Integrates [SOPS](https://getsops.io) with Nix for handling encrypted secrets      |
| [stylix](https://github.com/nix-community/stylix)                                | Theming framework for NixOS, Home Manager, nix-darwin                              |
| [zen-browser](https://github.com/0xc000022070/zen-browser-flake)                 | Community-driven Nix Flake for the [Zen](https://zen-browser.app) browser          |
| [hyprland](https://github.com/hyprwm/Hyprland)                                   | Official [Hyprland](https://hypr.land/) Nix Flake                                  |
| [nixcord](https://github.com/KaylorBen/nixcord)                                  | Declarative [Vencord](https://vencord.dev/) Nix Flake                              |
| [spicetify-nix](https://github.com/Gerg-L/spicetify-nix)                         | A nix library for modifying spotify with [spicetify](https://github.com/spicetify) |
| [nix-vscode-extensions](https://github.com/nix-community/nix-vscode-extensions)  | Nix expressions for VS Code Marketplace and Open VSX extensions                    |

## Modules

The repository is split into several module types.

- [NixOS Modules](https://github.com/wiizzl/nix-config/tree/main/modules/nixos): System configurations tailored for NixOS.
- [Home Manager Modules](https://github.com/wiizzl/nix-config/tree/main/modules/home): User-specific setups managed by [Home Manager](https://github.com/nix-community/home-manager).
- [Darwin Modules](https://github.com/wiizzl/nix-config/tree/main/modules/darwin): macOS system configurations using [nix-darwin](https://github.com/nix-darwin/nix-darwin).
- [Shared Modules](https://github.com/wiizzl/nix-config/tree/main/modules/shared): Common settings for both NixOS and Darwin platforms.

Each module group contains an `import.nix` file at its root, which automatically locates and imports all `default.nix` files within its directory tree. These imports are referenced in the `configuration.nix` file for each host.

Modules are off by default and can be activated by setting options such as `type.name.enable = true;`.

The repository uses a modular, opinionated structure. While it may seem complex initially, this organization makes it straightforward to reuse existing modules or add support for new hosts.

## Layout

```
├── wallpapers/      # Image files for wallpapers
├── hosts/
│   └── desktop/     # Main desktop setup (AMD 5950x, 64GB DDR4, AMD 6600XT)
├── flake.nix
├── flake.lock
├── lib/             # Custom functions extending `nixpkgs.lib`
├── shells/          # Development shell environments
└── modules/
  ├── darwin/        # macOS-specific apps, system tweaks, CLI utilities
  ├── home/          # Home Manager modules for user apps, desktops, CLI tools
  ├── nixos/         # NixOS modules for apps, desktops, services, system configs
  └── shared/        # Modules shared by NixOS and macOS (aliases, fonts, CLI utilities)
```

## Installation

1. Create your host and add it to the flakes entries

```sh
mkdir -p ~/nix-config/hosts/<your-host>
```

> [!TIP]
> Replace <your-host> with a short alias for your device

```sh
nano ~/nix-config/flake.nix
```

```nix
nixosConfigurations = {
  # ... other hosts
  # <your-host> = makeNixosSystem ./hosts/<your-host>/configuration.nix "x86_64-linux";
};
```

> [!IMPORTANT]
> Replace "x86_64-linux" with your system architecture. Make sure it is supported first !

2. Edit the configuration based on your needs

```sh
nano ~/nix-config/hosts/<your-host>/configuration.nix
```

> [!INFO]
> You will need to explore the configuration to understand how to add your own things

3. Generate hardware-configuration.nix and move it yo your host

> [!IMPORTANT]
> You can skip this step if you are not on NixOS

```sh
nixos-generate-config # You probably need to sudo it
cp /etc/nixos/hardware-configuration.nix ~/nix-config
```

4. Build the configuration and reboot your device
