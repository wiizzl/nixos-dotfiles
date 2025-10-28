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
  options.my.apps.vscode = {
    enable = mkEnableOption "Enable Visual Studio Code";
  };

  config = mkIf apps.vscode.enable {
    environment.systemPackages = with pkgs; [
      vscode
    ];
  };
}
