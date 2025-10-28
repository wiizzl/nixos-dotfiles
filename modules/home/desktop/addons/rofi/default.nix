{ config, lib, ... }:

with lib;
let
  inherit (config.my) desktop user;
in
{
  options.my.desktop.addons.rofi = {
    enable = mkEnableOption "Enable Rofi app launcher";
  };

  config = mkIf desktop.addons.rofi.enable {
    home-manager.users.${user.name} = {
      stylix = mkIf desktop.addons.stylix.enable {
        targets.rofi.enable = false;
      };

      programs.rofi = {
        enable = true;
        modes = [ "drun" ];

        extraConfig = {
          show-icons = true;

          drun-display-format = "{icon} {name}";
          display-drun = " Apps";
        };

        theme =
          let
            mkLiteral = config.lib.formats.rasi.mkLiteral;
            colors = mkIf desktop.addons.stylix.enable config.lib.stylix.colors;
            hex = base: mkLiteral "#${base}";

            palette = {
              # TODO: default theme
              mauve = hex colors.base0D;
              red = hex colors.base08;
              blue = hex colors.base0E;
              surface1 = hex colors.base03;
              base = hex colors.base00;
            };
          in
          {
            "*" = {
              inherit (palette)
                mauve
                red
                blue
                surface1
                base
                ;

              bg = mkLiteral "@base";
              hv = mkLiteral "@mauve";
              primary = mkLiteral "@surface1";
              ug = mkLiteral "@red";
              kl = mkLiteral "@blue";
              black = mkLiteral "#000000";
              transparent = mkLiteral "rgba(46,52,64,0)";
              background-color = mkLiteral "@bg";
              border = mkLiteral "0px";
            };

            "window" = {
              width = 700;
              orientation = mkLiteral "horizontal";
              location = mkLiteral "center";
              anchor = mkLiteral "center";
              transparency = mkLiteral "\"screenshot\"";
              border-color = mkLiteral "@transparent";
              border = mkLiteral "0px";
              border-radius = mkLiteral "6px";
              spacing = mkLiteral "0";
              children = map mkLiteral [ "mainbox" ];
            };

            "mainbox" = {
              spacing = mkLiteral "0";
              children = map mkLiteral [
                "inputbar"
                "message"
                "listview"
              ];
            };

            "inputbar" = {
              color = mkLiteral "@kl";
              padding = mkLiteral "11px";
              border = mkLiteral "3px 3px 2px 3px";
              border-color = mkLiteral "@primary";
              border-radius = mkLiteral "6px 6px 0px 0px";
            };

            "message" = {
              padding = mkLiteral "0";
              border-color = mkLiteral "@primary";
              border = mkLiteral "0px 1px 1px 1px";
            };

            "entry" = {
              text-font = mkLiteral "inherit";
              text-color = mkLiteral "inherit";
              cursor = mkLiteral "pointer";
            };

            "prompt" = {
              text-font = mkLiteral "inherit";
              text-color = mkLiteral "inherit";
              margin = mkLiteral "0px 5px 0px 0px";
            };

            "case-indicator" = {
              text-font = mkLiteral "inherit";
              text-color = mkLiteral "inherit";
            };

            "listview" = {
              layout = mkLiteral "vertical";
              padding = mkLiteral "8px";
              lines = 7;
              columns = 2;
              border = mkLiteral "0px 3px 3px 3px";
              border-radius = mkLiteral "0px 0px 6px 6px";
              border-color = mkLiteral "@primary";
              dynamic = false;
            };

            "element" = {
              padding = mkLiteral "2px";
              vertical-align = mkLiteral "1";
              color = mkLiteral "@kl";
              font = mkLiteral "inherit";
            };

            "element-text" = {
              background-color = mkLiteral "inherit";
              text-color = mkLiteral "inherit";
              vertical-align = mkLiteral "0.5";
            };

            "element selected.normal" = {
              color = mkLiteral "@black";
              background-color = mkLiteral "@hv";
            };

            "element normal active" = {
              background-color = mkLiteral "@hv";
              color = mkLiteral "@black";
            };

            "element-icon" = {
              background-color = mkLiteral "inherit";
              text-color = mkLiteral "inherit";
              size = mkLiteral "2.5em";
            };

            "element normal urgent" = {
              background-color = mkLiteral "@primary";
            };

            "element selected active" = {
              background = mkLiteral "@hv";
              foreground = mkLiteral "@bg";
            };

            "button" = {
              padding = mkLiteral "6px";
              color = mkLiteral "@primary";
              horizonatal-align = mkLiteral "0.5";
              border = mkLiteral "2px 0px 2px 2px";
              border-radius = mkLiteral "4px 0px 0px 4px";
              border-color = mkLiteral "@primary";
            };

            "button selected normal" = {
              border = mkLiteral "2px 0px 2px 2px";
              border-color = mkLiteral "@primary";
            };
          };
      };
    };
  };
}
