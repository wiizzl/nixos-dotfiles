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
  options.apps.qimgv = {
    enable = mkEnableOption "Enable qimgv image viewer";
  };

  config = mkIf apps.qimgv.enable {
    environment.systemPackages = with pkgs; [
      qimgv
    ];
  };
}
