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
  options.my.apps.editor.zed = {
    enable = mkEnableOption "Enable Zed Editor";
  };

  config = mkIf apps.editor.zed.enable {
    environment.systemPackages = with pkgs; [
      zed-editor
    ];
  };
}
