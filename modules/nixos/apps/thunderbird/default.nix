{
  pkgs,
  config,
  lib,
  ...
}:

with lib;
let
  inherit (config) apps;
in
{
  options.apps.thunderbird = {
    enable = mkEnableOption "Enable Thunderbird";
  };

  config = mkIf apps.thunderbird.enable {
    environment.systemPackages = with pkgs; [
      thunderbird
    ];
  };
}
