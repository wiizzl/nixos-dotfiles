{ config, lib, ... }:

with lib;
let
  inherit (config) user;

  starship = import ../../../nixos/user/starship {
    inherit config lib;
  };
in
{
  config = mkIf user.shell.starship.enable {
    home-manager.users.${user.name} = starship;
  };
}
