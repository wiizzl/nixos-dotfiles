{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:

with lib;
let
  inherit (config.my) apps user;

  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in
{
  imports = [ inputs.spicetify-nix.homeManagerModules.default ];

  options.my.apps.spotify = {
    enable = mkEnableOption "Enable Spotify with Spicetify";
  };

  config = mkIf apps.spotify.enable {
    home-manager.users.${user.name} = {
      programs.spicetify = {
        enable = true;

        enabledExtensions = with spicePkgs.extensions; [
          hidePodcasts
          adblock
        ];
      };
    };
  };
}
