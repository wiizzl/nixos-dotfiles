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
  options.my.cli.btop = {
    enable = mkEnableOption "Enable btop";
  };

  config = mkIf cli.btop.enable {
    environment.systemPackages = with pkgs; [
      btop
    ];
  };
}
