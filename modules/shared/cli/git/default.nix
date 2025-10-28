{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  inherit (config) cli;
in
{
  options.cli.git = {
    enable = mkEnableOption "Enable git";
    name = mkOption {
      type = types.str;
      description = "Git user name";
    };
    email = mkOption {
      type = types.str;
      description = "Git user email";
    };
  };

  config = mkIf cli.git.enable {
    home.packages = with pkgs; [
      git
      gh
    ];
  };
}
