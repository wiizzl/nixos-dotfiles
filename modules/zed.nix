{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nil
    nixd
  ];

  programs.zed-editor = {
    enable = true;
  };
}
