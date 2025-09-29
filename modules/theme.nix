{ pkgs, ... }:

{
  home.packages = with pkgs; [
    dconf
  ];

  gtk = {
    enable = true;
    colorScheme = "dark";
  };
}
