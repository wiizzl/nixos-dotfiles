{ ... }:

{
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
        }
      }
    '';
  };
}
