{
  pkgs,
  config,
  lib,
  inputs,
  ...
}:

with lib;
let
  inherit (config.my) user;
in
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  config = mkIf user.home-manager {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = "backup";
      extraSpecialArgs = {
        inherit inputs;
        inherit user;
      };

      users."pier" = {
        programs.home-manager.enable = true;

        home = {
          username = "pier";
          homeDirectory = "/home/pier";
          stateVersion = "25.05";
        };
      };
    };
  };
}
