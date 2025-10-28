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
  options.my.apps.slack = {
    enable = mkEnableOption "Enable Slack";
  };

  config = mkIf apps.slack.enable {
    environment.systemPackages = with pkgs; [
      slack
    ];
  };
}
