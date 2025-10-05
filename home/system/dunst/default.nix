{ ... }:

{
  services.dunst = {
    enable = true;

    settings = {
      global = {
        follow = "keyboard";
        width = "(250, 500)";
        height = "(0, 750)";
        offset = "(17, 26)";
        padding = 5;
        horizontal_padding = 5;
        gap_size = 3;
        transparency = 35;
        frame_width = 1;
        corner_radius = 5;
        min_icon_size = 32;
        max_icon_size = 32;
        format = "<b>%s</b>\n%b";
      };
    };
  };
}
