{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

with lib;
let
  inherit (config.my) apps desktop user;

  pkgsWithOverlay = import pkgs.path {
    system = pkgs.stdenv.hostPlatform.system;
    overlays = [ inputs.nix-vscode-extensions.overlays.default ];
    config = pkgs.config;
  };
in
{
  config = mkIf apps.editor.zed.enable {
    home-manager.users.${user.name} = {
      stylix = mkIf desktop.addons.stylix.enable {
        targets.zed.enable = false;
      };

      programs.zed-editor = {
        enable = true;

        extensions = [ ];

        extraPackages = [
          pkgs.nixd
        ];

        userSettings = { };
      };
    };
  };
}
