{ pkgs, config, ... }:

{
  home.packages = with pkgs; [ fastfetch ];

  xdg.configFile."fastfetch" = {
    source =
      config.lib.file.mkOutOfStoreSymlink "/home/"
      + config.var.username
      + "/nixos-dotfiles/home/programs/fastfetch/config";
    recursive = true;
  };
}
