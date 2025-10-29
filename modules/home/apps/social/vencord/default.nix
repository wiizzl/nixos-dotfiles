{
  config,
  lib,
  inputs,
  ...
}:

with lib;
let
  inherit (config.my) apps desktop user;
in
{
  config = mkIf apps.social.vencord.enable {
    home-manager.users.${user.name} = {
      imports = [ inputs.nixcord.homeModules.nixcord ];

      stylix = mkIf desktop.addons.stylix.enable {
        targets.nixcord.enable = false;
      };

      programs.nixcord = {
        enable = true;
        vesktop.enable = true;
        discord.enable = false;

        quickCss = "@import url('https://catppuccin.github.io/discord/dist/catppuccin-mocha-mauve.theme.css');";

        config = {
          useQuickCss = true;
          frameless = true;

          plugins = {
            fakeNitro.enable = true;
            callTimer.enable = true;
            friendsSince.enable = true;
            shikiCodeblocks.enable = true;
            voiceMessages.enable = true;
            messageLogger.enable = true;
          };
        };
      };
    };
  };
}
