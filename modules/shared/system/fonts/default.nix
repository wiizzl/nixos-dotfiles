{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  inherit (config) system;
in
{
  options.system.fonts = {
    enable = mkEnableOption "Enable fonts";
    default = mkOption {
      type = types.bool;
      default = false;
      description = "Enable default fonts";
    };
  };

  config = mkIf system.fonts.enable {
    fonts = {
      packages = with pkgs; [
        # TODO: add fonts
      ];

      enableDefaultPackages = system.fonts.default;
    };
  };
}
