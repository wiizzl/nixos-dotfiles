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
  options.apps.postman = {
    enable = mkEnableOption "Enable Postman";
  };

  config = mkIf apps.postman.enable {
    environment.systemPackages = with pkgs; [
      postman
    ];
  };
}
