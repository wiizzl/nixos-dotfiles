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
  config = mkIf apps.jetbrains.ideau.enable {
    environment.systemPackages = with pkgs; [
      jetbrains.idea-ultimate
    ];
  };
}
