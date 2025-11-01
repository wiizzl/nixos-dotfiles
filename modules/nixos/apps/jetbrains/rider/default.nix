{
  pkgs,
  config,
  lib,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;
  inherit (config.my) apps;
in
{
  options.my.apps.jetbrains = {
    rider.enable = mkEnableOption "Enable Jetbrains C# IDE";
  };
  config = mkIf apps.jetbrains.rider.enable {
    environment.systemPackages = with pkgs; [
      jetbrains.rider
    ];
  };
}
