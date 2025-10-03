{ config, ... }:

{
  xdg.configFile."qtile" = {
    source =
      config.lib.file.mkOutOfStoreSymlink "/home/"
      + config.var.username
      + "/nixos-dotfiles/home/system/qtile/config";
    recursive = true;
  };
}
