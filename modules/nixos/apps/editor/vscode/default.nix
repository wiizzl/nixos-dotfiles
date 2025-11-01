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
  options.my.apps.editor.vscode = {
    enable = mkEnableOption "Enable Visual Studio Code";
  };

  config = mkIf apps.editor.vscode.enable {
    environment.systemPackages = with pkgs; [
      vscode
    ];
  };
}
