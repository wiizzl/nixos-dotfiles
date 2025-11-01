{
  pkgs,
  config,
  lib,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;
  inherit (config.my) apps;
in
{
  options.my.apps.media = {
    qimgv.enable = mkEnableOption "Qimgv image viewer";
  };

  config = mkIf apps.media.qimgv.enable {
    environment.systemPackages = with pkgs; [
      qimgv
    ];
  };
}
