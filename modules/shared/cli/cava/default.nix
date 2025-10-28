{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  inherit (config.my) cli;
in
{
  options.my.cli.cava = {
    enable = mkEnableOption "Enable cava";
  };

  config = mkIf cli.cava.enable {
    environment.systemPackages = with pkgs; [
      cava
    ];
  };
}
