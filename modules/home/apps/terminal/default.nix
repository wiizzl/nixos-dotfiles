{ config, lib, ... }:

with lib;
let
  inherit (config.my) apps;
in
{
  options.my.apps.terminal = {
    wezterm.enable = mkEnableOption "Enable Wez's terminal emulator";
    kitty.enable = mkEnableOption "Enable Kitty terminal emulator";
  };
}
