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
  options.my.apps.social = {
    element.enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Element matrix client";
    };
    slack.enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Slack client";
    };
    thunderbird.enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Thunderbird email client";
    };
  };
}
