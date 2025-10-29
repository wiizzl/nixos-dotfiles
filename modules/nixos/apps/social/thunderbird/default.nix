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
  config = mkIf apps.social.thunderbird.enable {
    environment.systemPackages = with pkgs; [
      thunderbird
    ];
  };
}
