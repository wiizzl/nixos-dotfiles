{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  inherit (config) cli;
in
{
  options.cli.cava = {
    enable = mkEnableOption "Enable cava";
  };

  config = mkIf cli.cava.enable {
    environment.systemPackages = with pkgs; [
      cava
    ];
  };
}
