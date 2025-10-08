{ config, ... }:

{
  xdg.configFile."polybar/config.ini" = {
    source = config.lib.file.mkOutOfStoreSymlink "/home/pier/nixos-dotfiles/confs/polybar";
  };
}
