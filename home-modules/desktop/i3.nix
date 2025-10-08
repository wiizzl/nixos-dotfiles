{ config, ... }:

{
  xdg.configFile."i3/config" = {
    source = config.lib.file.mkOutOfStoreSymlink "/home/pier/nixos-dotfiles/confs/i3";
  };
}
