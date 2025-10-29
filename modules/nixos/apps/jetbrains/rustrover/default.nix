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
  config = mkIf apps.jetbrains.rustrover.enable {
    environment.systemPackages = with pkgs; [
      jetbrains.rust-rover
    ];
  };
}
