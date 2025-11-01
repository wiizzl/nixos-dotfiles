{
  pkgs,
  config,
  lib,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;
  inherit (config.my) apps;
in
{
  options.my.apps.jetbrains = {
    rustrover.enable = mkEnableOption "Enable Jetbrains Rust IDE";
  };

  config = mkIf apps.jetbrains.rustrover.enable {
    environment.systemPackages = with pkgs; [
      jetbrains.rust-rover
    ];
  };
}
