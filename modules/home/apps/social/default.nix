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
    vencord.enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Vencord client";
    };
  };
}
