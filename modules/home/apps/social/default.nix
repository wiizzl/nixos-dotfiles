{ config, lib, ... }:

with lib;
let
  inherit (config.my) apps;
in
{
  options.my.apps.social = {
    vencord = mkEnableOption "Enable Vencord client";
  };
}
