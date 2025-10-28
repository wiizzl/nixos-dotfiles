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
  options.my.apps.thunderbird = {
    enable = mkEnableOption "Enable Thunderbird";
  };

  config = mkIf apps.thunderbird.enable {
    environment.systemPackages = with pkgs; [
      thunderbird
    ];
  };
}
