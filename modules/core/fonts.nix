{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      minecraftia
    ];

    enableDefaultPackages = false;
  };
}
