{ config, lib, ... }:

with lib;
let
  inherit (config.my) apps;
in
{
  options.my.apps.jetbrains = {
    androidstudio.enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Android Studio";
    };
    rider.enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Jetbrains C# IDE";
    };
    webstorm.enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Jetbrains Web IDE";
    };
    clion.enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Jetbrains C/C++ IDE";
    };
    goland.enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Jetbrains Go IDE";
    };
    phpstorm.enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Jetbrains PHP IDE";
    };
    datagrip.enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Jetbrains Database Manager";
    };
    rustrover.enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Jetbrains Rust IDE";
    };
    ideau.enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Jetbrains Java/Kotlin IDE";
    };
  };
}
