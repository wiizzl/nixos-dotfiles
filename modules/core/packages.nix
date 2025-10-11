{ ... }:

{
  environment.systemPackages = with pkgs; [
    wget
    curl
  ];
}
