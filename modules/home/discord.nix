{ inputs, ... }:

{
  imports = [ inputs.nixcord.homeModules.nixcord ];

  programs.nixcord = {
    enable = true;
    vesktop.enable = true;
    discord.enable = false;

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
