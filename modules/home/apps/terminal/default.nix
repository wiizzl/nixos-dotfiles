{ config, lib, ... }:

with lib;
let
  inherit (config.my) apps;
in
{
  options.my.apps.terminal = {
    wezterm.enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Wez's terminal emulator";
    };
    kitty.enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Kitty terminal emulator";
    };
  };
}
