{
  pkgs,
  config,
  lib,
  ...
}:

with lib;
let
  inherit (config) cli;
in
{
  options.cli.just = {
    enable = mkEnableOption "Enable just";
  };

  config = mkIf cli.just.enable {
    environment.systemPackages = with pkgs; [
      just
    ];
  };
}
