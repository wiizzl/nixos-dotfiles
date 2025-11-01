{ config, lib, ... }:

with lib;
let
  inherit (config.my) apps;
in
{
  options.my.apps.social = {
    element.enable = mkEnableOption "Element matrix client";
    slack.enable = mkEnableOption "Slack client";
    thunderbird.enable = mkEnableOption "Thunderbird email client";
  };
}
