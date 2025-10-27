# nixos-dotfiles

![Workflow status](https://github.com/wiizzl/nixos-dotfiles/actions/workflows/flake-check.yml/badge.svg)
![Workflow status](https://github.com/wiizzl/nixos-dotfiles/actions/workflows/flake-updater.yml/badge.svg)

This is my NixOS configuration files. Much inspired by configurations found online.

1. Generate hardware-configuration.nix

```sh
sudo nixos-generate-config
```

2. Build the system

```sh
cd nixos-dotfiles
sudo chmod +x ./build.sh

./build.sh
```

3. Reboot your computer

```sh
reboot
```

4. Rebuild the config whenever you want

```sh
nrs <host> # atm: desktop or laptop
```
