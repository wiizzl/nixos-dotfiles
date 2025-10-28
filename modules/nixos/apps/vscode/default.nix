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
  options.apps.vscode = {
    enable = mkEnableOption "Enable Visual Studio Code";
  };

  config = mkIf apps.vscode.enable {
    environment.systemPackages = with pkgs; [
      vscode
    ];
  };
}
