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
  options.apps.slack = {
    enable = mkEnableOption "Enable Slack";
  };

  config = mkIf apps.slack.enable {
    environment.systemPackages = with pkgs; [
      slack
    ];
  };
}
