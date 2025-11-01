{ config, lib, ... }:

with lib;
let
  inherit (config.my) apps;
in
{
  options.my.apps.jetbrains = {
    androidstudio.enable = mkEnableOption "Enable Jetbrains Android Studio IDE";
    rider.enable = mkEnableOption "Enable Jetbrains C# IDE";
    webstorm.enable = mkEnableOption "Enable Jetbrains Web IDE";
    clion.enable = mkEnableOption "Enable Jetbrains C/C++ IDE";
    goland.enable = mkEnableOption "Enable Jetbrains Go IDE";
    phpstorm.enable = mkEnableOption "Enable Jetbrains PHP IDE";
    datagrip.enable = mkEnableOption "Enable Jetbrains Database Manager";
    rustrover.enable = mkEnableOption "Enable Jetbrains Rust IDE";
    ideau.enable = mkEnableOption "Enable Jetbrains Java/Kotlin IDE";
  };
}
