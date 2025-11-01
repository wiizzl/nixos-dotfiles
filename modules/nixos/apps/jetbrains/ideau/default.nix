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
  options.my.apps.jetbrains = {
    ideau.enable = mkEnableOption "Enable Jetbrains Java/Kotlin IDE";
  };

  config = mkIf apps.jetbrains.ideau.enable {
    environment.systemPackages = with pkgs; [
      jetbrains.idea-ultimate
    ];
  };
}
