{ ... }:

{
  programs = {
    bash = {
      shellAliases = {
        gs = "git status";
        ga = "git add .";
        gc = "git clone";
        gcm = "git commit -m";
      };
    };

    git = {
      enable = true;
      userName = "wiizzl";
      userEmail = "github@houlliere.com";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
  };
}
