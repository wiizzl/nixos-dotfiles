# nixos-dotfiles

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

3. Rebuild the config whenever you want

```sh
nrs <host> # atm: desktop or laptop
```
