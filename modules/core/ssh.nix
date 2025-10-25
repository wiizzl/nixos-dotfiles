{ ... }:

{
  services.openssh = {
    enable = true;

    settings = {
      PermitRootLogin = "prohibit-password"; # "yes", "without-password", "prohibit-password", "forced-commands-only", "no"
      AllowUsers = null; # Allows all users by default.
      UseDns = true;
      PasswordAuthentication = true;
    };

    ports = [ 22 ];
  };
}
