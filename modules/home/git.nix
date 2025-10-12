{ config, ... }:

{
  programs.git = {
    enable = true;

    userName = config.var.git.username;
    userEmail = config.var.git.email;

    extraConfig = {
      init.defaultBranch = "main";
    };

    aliases = {
      c = "commit -m";
      s = "status";
      d = "diff";
      b = "branch";
      p = "pull";
    };
  };
}
