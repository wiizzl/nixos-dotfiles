{ pkgs, ... }:

{
  home.packages = with pkgs; [ fastfetch ];

  # TODO: symlink to config
}
