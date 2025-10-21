{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wget
    curl
    killall
    playerctl
    zip
    unzip
  ];
}
