{ ... }:

{
  programs.nixcord = {
    enable = true;
    vesktop.enable = true;
    discord.enable = false;
    quickCss = "@import url('https://catppuccin.github.io/discord/dist/catppuccin-mocha.theme.css');";

    config = {
      useQuickCss = true;
      frameless = true;
      plugins = {
        fakeNitro.enable = true;
      };
    };
  };
}
