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
in
{

  options.my.apps.spotify = {
    enable = mkEnableOption "Enable Spotify with Spicetify";
  };

  config = mkIf apps.spotify.enable {
    home-manager.users.${user.name} = {
      imports = [ inputs.spicetify-nix.homeManagerModules.default ];

      programs.spicetify =
        let
          spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
        in
        {
          enable = true;

          enabledExtensions = with spicePkgs.extensions; [
            hidePodcasts
            adblock
          ];
        };
    };
  };
}
