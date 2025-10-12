{ pkgs, ... }:

{
  stylix.targets.vscode.enable = false;

  programs.vscode = {
    enable = true;

    package = pkgs.vscodium;

    profiles.default = {
      userSettings = {
        # Theme
        "workbench.iconTheme" = "flow-dim";
        "workbench.colorTheme" = "Catppuccin Mocha";
        "catppuccin.accentColor" = "blue";
        "workbench.productIconTheme" = "material-product-icons";

        # Misc
        "workbench.startupEditor" = "none";
        "files.enableTrash" = true;
        "explorer.compactFolders" = false;
        "editor.linkedEditing" = true;
        "files.trimTrailingWhitespace" = true;

        # Formatter
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
        "prettier.printWidth" = 120;
        "[prisma]".editor.defaultFormatter = "Prisma.prisma";
        "[python]".editor.defaultFormatter = "charliermarsh.ruff";
        "prettier.documentSelectors" = [ "**/*.astro" ];
        "[astro]".editor.defaultFormatter = "esbenp.prettier-vscode";
        "[nix]".editor.defaultFormatter = "jnoortheen.nix-ide";

        # Font
        "editor.fontLigatures" = true;

        # Font size
        "editor.fontSize" = 16;
        "terminal.integrated.fontSize" = 15;

        # Tab size
        "editor.tabSize" = 2;

        # Files limitation
        "workbench.editor.limit.enabled" = true;
        "workbench.editor.limit.value" = 6;

        # Typescript
        "typescript.inlayHints.parameterNames.enabled" = "all";
        "typescript.updateImportsOnFileMove.enabled" = "always";

        # Files save
        "files.autoSave" = "onFocusChange";
        "editor.formatOnSave" = true;
        "editor.codeActionsOnSave" = {
          "source.fixAll" = "explicit";
          "source.organizeImports" = "explicit";
        };

        # Window UI
        "window.commandCenter" = false;
        "window.titleBarStyle" = "custom";
        "workbench.activityBar.location" = "top";
        "workbench.sideBar.location" = "right";
        "editor.accessibilitySupport" = "off";
        "editor.bracketPairColorization.enabled" = true;
        "editor.guides.bracketPairs" = true;

        # Git
        "git.autofetch" = true;
        "git.confirmSync" = false;
        "git.ignoreRebaseWarning" = true;
        "git.enableSmartCommit" = true;

        # Delete confirmation
        "explorer.confirmDelete" = false;
        "explorer.confirmDragAndDrop" = false;

        # Smooth animations
        "editor.cursorSmoothCaretAnimation" = "on";
        "editor.smoothScrolling" = true;
        "workbench.list.smoothScrolling" = true;
        "terminal.integrated.smoothScrolling" = true;
        "editor.cursorBlinking" = "expand";

        # Discord RPC
        "discord.detailsDebugging" = "🦾 {file_name}";
        "discord.detailsEditing" = "✏️ {file_name}";
        "discord.detailsIdling" = "💤 Idling";
        "discord.largeImage" = "{LANG}";
        "discord.lowerDetailsDebugging" = "🦾 {workspace}";
        "discord.lowerDetailsIdling" = "💤 Idling";
        "discord.largeImageIdling" = "💤 Idling";
        "discord.lowerDetailsEditing" = "📂 {workspace}";
        "discord.lowerDetailsNoWorkspaceFound" = "📑 No workspace";
        "discord.swapBigAndSmallImage" = true;
      };

      extensions = with pkgs.vscode-marketplace; [
        gruntfuggly.todo-tree
        astro-build.astro-vscode
        jnoortheen.nix-ide
        adpyke.codesnap
        naumovs.color-highlight
        catppuccin.catppuccin-vsc
        pkief.material-product-icons
        thang-nm.flow-icons
        usernamehw.errorlens
        yoavbls.pretty-ts-errors
        dbaeumer.vscode-eslint
        prisma.prisma
        golang.go
        ms-vsliveshare.vsliveshare
        unifiedjs.vscode-mdx
        quicktype.quicktype
        esbenp.prettier-vscode
        bradlc.vscode-tailwindcss
        ms-python.python
        ms-python.debugpy
        ms-python.vscode-python-envs
        charliermarsh.ruff
        meganrogge.template-string-converter
        # github.copilot
        # github.copilot-chat
      ];
    };
  };
}
