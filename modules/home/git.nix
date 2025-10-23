{ var, ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = var.git.username;
        email = var.git.email;
      };

      alias = {
        c = "commit -m";
        s = "status";
        d = "diff";
        b = "branch";
        p = "pull";
      };

      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };
}
