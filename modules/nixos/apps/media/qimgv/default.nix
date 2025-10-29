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
  config = mkIf apps.media.qimgv.enable {
    environment.systemPackages = with pkgs; [
      qimgv
    ];
  };
}
