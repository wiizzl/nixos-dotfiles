{ config, ... }:

let
  username = config.var.git.username;
  email = config.var.git.email;
in
{
  programs.git = {
    enable = true;

    userName = username;
    userEmail = email;

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
