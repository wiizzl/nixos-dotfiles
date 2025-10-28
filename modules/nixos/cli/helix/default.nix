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
  options.my.cli.helix = {
    enable = mkEnableOption "Enable Helix editor";
  };

  config = mkIf cli.helix.enable {
    environment.systemPackages = with pkgs; [
      helix
    ];
  };
}
