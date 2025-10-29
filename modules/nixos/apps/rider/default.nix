{
  pkgs,
  config,
  lib,
  ...
}:

with lib;
let
  inherit (config.my) apps;
in
{
  options.my.apps.rider = {
    enable = mkEnableOption "Enable Jetbrains Rider IDE";
  };

  config = mkIf apps.rider.enable {
    environment.systemPackages = with pkgs; [
      jetbrains.rider
    ];
  };
}
