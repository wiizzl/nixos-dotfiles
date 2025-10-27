{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wget
    curl
    killall
    zip
    unzip
  ];
}
