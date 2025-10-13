{ ... }:

{
  services.mako = {
    enable = false;

    settings = {
      "actionable=true" = {
        anchor = "top-left";
      };
      actions = true;
      anchor = "top-right";
      border-radius = 6;
      default-timeout = 5;
      height = 100;
      icons = true;
      ignore-timeout = false;
      layer = "top";
      margin = 10;
      markup = true;
      width = 300;
    };
  };
}
