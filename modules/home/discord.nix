{ inputs, ... }:

{
  imports = [ inputs.nixcord.homeModules.nixcord ];

  stylix.targets.nixcord.enable = false;

  programs.nixcord = {
    enable = true;
    vesktop.enable = true;
    discord.enable = false;

    quickCss = "@import url('https://catppuccin.github.io/discord/dist/catppuccin-mocha-blue.theme.css');";

    config = {
      useQuickCss = true;
      frameless = true;
      plugins = {
        fakeNitro.enable = true;
        callTimer.enable = true;
        friendsSince.enable = true;
        shikiCodeblocks.enable = true;
        voiceMessages.enable = true;
        showHiddenThings.enable = true;
        messageLogger.enable = true;
      };
    };
  };
}
