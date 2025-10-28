theme =
          let
            colors = mkIf desktop.addons.stylix.enable config.lib.stylix.colors;
            hex = base: "#${base}";

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

              bg = "@base";
              hv = "@mauve";
              primary = "@surface1";
              ug = "@red";
              kl = "@blue";
              black = "#000000";
              transparent = "rgba(46,52,64,0)";
              background-color = "@bg";
              border = "0px";
            };

            "window" = {
              width = 700;
              orientation = "horizontal";
              location = "center";
              anchor = "center";
              transparency = "\"screenshot\"";
              border-color = "@transparent";
              border = "0px";
              border-radius = "6px";
              spacing = "0";
              children = map [ "mainbox" ];
            };

            "mainbox" = {
              spacing = "0";
              children = map [
                "inputbar"
                "message"
                "listview"
              ];
            };

            "inputbar" = {
              color = "@kl";
              padding = "11px";
              border = "3px 3px 2px 3px";
              border-color = "@primary";
              border-radius = "6px 6px 0px 0px";
            };

            "message" = {
              padding = "0";
              border-color = "@primary";
              border = "0px 1px 1px 1px";
            };

            "entry" = {
              text-font = "inherit";
              text-color = "inherit";
              cursor = "pointer";
            };

            "prompt" = {
              text-font = "inherit";
              text-color = "inherit";
              margin = "0px 5px 0px 0px";
            };

            "case-indicator" = {
              text-font = "inherit";
              text-color = "inherit";
            };

            "listview" = {
              layout = "vertical";
              padding = "8px";
              lines = 7;
              columns = 2;
              border = "0px 3px 3px 3px";
              border-radius = "0px 0px 6px 6px";
              border-color = "@primary";
              dynamic = false;
            };

            "element" = {
              padding = "2px";
              vertical-align = "1";
              color = "@kl";
              font = "inherit";
            };

            "element-text" = {
              background-color = "inherit";
              text-color = "inherit";
              vertical-align = "0.5";
            };

            "element selected.normal" = {
              color = "@black";
              background-color = "@hv";
            };

            "element normal active" = {
              background-color = "@hv";
              color = "@black";
            };

            "element-icon" = {
              background-color = "inherit";
              text-color = "inherit";
              size = "2.5em";
            };

            "element normal urgent" = {
              background-color = "@primary";
            };

            "element selected active" = {
              background = "@hv";
              foreground = "@bg";
            };

            "button" = {
              padding = "6px";
              color = "@primary";
              horizonatal-align = "0.5";
              border = "2px 0px 2px 2px";
              border-radius = "4px 0px 0px 4px";
              border-color = "@primary";
            };

            "button selected normal" = {
              border = "2px 0px 2px 2px";
              border-color = "@primary";
            };
          };