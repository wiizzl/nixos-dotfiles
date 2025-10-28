{
  pkgs,
  config,
  lib,
  ...
}:

with lib;
let
  inherit (config.my) cli;
in
{
  options.my.cli.just = {
    enable = mkEnableOption "Enable just";
  };

  config = mkIf cli.just.enable {
    environment.systemPackages = with pkgs; [
      just
    ];
  };
}
