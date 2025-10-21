{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wget
    curl
    (callPackage ./helium.nix { })
  ];
}
