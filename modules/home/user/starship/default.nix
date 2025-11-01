{ config, lib, ... }:

let
  inherit (lib) mkIf;
  inherit (config.my) user;

  starship = import ../../../nixos/user/starship {
    inherit config lib;
  };
in
{
  config = mkIf user.shell.starship {
    home-manager.users.${user.name} = starship;
  };
}
