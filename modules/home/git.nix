{ var, ... }:

{
  programs.git = {
    enable = true;

    userName = var.git.username;
    userEmail = var.git.email;

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
