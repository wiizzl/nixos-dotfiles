{ config, ... }:

{
  services.getty.autologinUser = config.var.username;
}