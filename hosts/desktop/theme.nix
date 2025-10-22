{ pkgs, config, ... }:

{
  config.stylix = {
    enable = true;
    autoEnable = true;

    polarity = "dark";

    # See https://tinted-theming.github.io/tinted-gallery/ for more schemes
    base16Scheme = {
      base00 = "1e1e2e"; # Default Background
      base01 = "181825"; # Lighter Background (Used for status bars, line number and folding marks)
      base02 = "313244"; # Selection Background
      base03 = "45475a"; # Comments, Invisibles, Line Highlighting
      base04 = "585b70"; # Dark Foreground (Used for status bars)
      base05 = "cdd6f4"; # Default Foreground, Caret, Delimiters, Operators
      base06 = "f5e0dc"; # Light Foreground (Not often used)
      base07 = "b4befe"; # Light Background (Not often used)
      base08 = "f38ba8"; # Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
      base09 = "fab387"; # Integers, Boolean, Constants, XML Attributes, Markup Link Url
      base0A = "f9e2af"; # Classes, Markup Bold, Search Text Background
      base0B = "a6e3a1"; # Strings, Inherited Class, Markup Code, Diff Inserted
      base0C = "94e2d5"; # Support, Regular Expressions, Escape Characters, Markup Quotes
      base0D = "89b4fa"; # Functions, Methods, Attribute IDs, Headings, Accent color
      base0E = "cba6f7"; # Keywords, Storage, Selector, Markup Italic, Diff Changed
      base0F = "f2cdcd"; # Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>
    };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 32;
    };

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.meslo-lg;
        name = "Meslo LGM Nerd Font";
      };
      sansSerif = {
        package = pkgs.montserrat;
        name = "Montserrat";
      };
      serif = config.stylix.fonts.sansSerif;
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
      sizes = {
        applications = 12;
        desktop = 13;
        popups = 13;
        terminal = 13;
      };
    };
  };
}
