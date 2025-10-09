{ pkgs, ... }:

{
  stylix.targets.vscode.enable = false;

  programs.vscode = {
    enable = true;

    package = pkgs.vscodium;

    extensions = with pkgs.vscode-extensions; [
      astro-build.astro-vscode
      Catppuccin.catppuccin-vsc
      Catppuccin.catppuccin-vsc-icons
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
    ];

  };
}
