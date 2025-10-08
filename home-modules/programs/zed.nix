{ pkgs, ... }:

{
  programs.zed-editor = {
    enable = true;

    extraPackages = with pkgs; [
      # nil
      nixd
    ];

    extensions = [
      "html"
      "astro"
      "nix"
      "toml"
      "php"
      "dockerfile"
      "sql"
      "vue"
      "xml"
      "prisma"
      "biome"
    ];

    userSettings = {
      agent = {
        inline_assistant_model = {
          provider = "copilot_chat";
          model = "gpt-4.1";
        };
        default_profile = "ask";
        default_model = {
          provider = "copilot_chat";
          model = "gpt-4o";
        };
        dock = "left";
      };
      project_panel = {
        dock = "left";
      };
      diagnostics = {
        button = false;
        include_warnings = true;
        inline = {
          enabled = true;
          update_debounce_ms = 150;
          padding = 4;
          min_column = 0;
          max_severity = null;
        };
      };
      indent_guides = {
        enabled = true;
        line_width = 1;
        active_line_width = 2;
        coloring = "indent_aware";
      };
    };
  };
}
