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
  config = mkIf apps.social.slack.enable {
    environment.systemPackages = with pkgs; [
      slack
    ];
  };
}
