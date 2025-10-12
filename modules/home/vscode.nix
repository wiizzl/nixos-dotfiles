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

        # Font
        # "editor.fontFamily" = "FiraCode Nerd Font";
        # "terminal.integrated.fontFamily" = "FiraCode Nerd Font";
        # "scm.inputFontFamily" = "FiraCode Nerd Font";
        # "chat.editor.fontFamily" = "FiraCode Nerd Font";
        # "debug.console.fontFamily" = "FiraCode Nerd Font";
        # "editor.codeLensFontFamily" = "FiraCode Nerd Font";
        # "notebook.output.fontFamily" = "FiraCode Nerd Font";
        # "markdown.preview.fontFamily" = "FiraCode Nerd Font";
        # "editor.inlayHints.fontFamily" = "FiraCode Nerd Font";
        # "editor.fontLigatures" = true;

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
        astro-build.astro-vscode
        Catppuccin.catppuccin-vsc
        thang-nm.flow-icons
        adpyke.codesnap
        naumovs.color-highlight
        GitHub.copilot
        GitHub.copilot-chat
        icrawl.discord-vscode
        usernamehw.errorlens
        yoavbls.pretty-ts-errors
        dsznajder.es7-react-js-snippets
        dbaeumer.vscode-eslint
        expo.vscode-expo-tools
        rphlmr.vscode-drizzle-orm
        Prisma.prisma
        AbianS.prisma-generate-uml
        golang.Go
        MS-vsliveshare.vsliveshare
        unifiedjs.vscode-mdx
        quicktype.quicktype
        esbenp.prettier-vscode
        bradlc.vscode-tailwindcss
        pflannery.vscode-versionlens
        Gruntfuggly.todo-tree
        ms-python.python
        ms-python.debugpy
        ms-python.vscode-python-envs
        charliermarsh.ruff
        meganrogge.template-string-converter
        jnoortheen.nix-ide
      ];
    };
  };
}
