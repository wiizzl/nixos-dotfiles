{ config, lib, ... }:

with lib;
let
  inherit (config.my) apps user;
in
{
  options.my.apps.wezterm = {
    enable = mkEnableOption "Enable Wez's terminal emulator";
  };

  config = mkIf apps.wezterm.enable {
    home-manager.users.${user.name} = {
      programs.wezterm = {
        enable = true;

        extraConfig = ''
          config.enable_tab_bar = false
          config.default_cursor_style = "SteadyBar"

          config.keys = {
            {
              key = "d",
              mods = "CTRL",
              action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" }
            },
            {
              key = "d",
              mods = "CTRL|SHIFT",
              action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" }
            },
            {
              key = "w",
              mods = 'CTRL',
              action = wezterm.action.CloseCurrentPane { confirm = true },
            }
          }
        '';
      };
    };
  };
}
