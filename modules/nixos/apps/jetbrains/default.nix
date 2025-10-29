{
  pkgs,
  config,
  lib,
  ...
}:

with lib;
let
  inherit (config.my) apps;
in
{
  options.my.apps.jetbrains = {
    enable = mkEnableOption "Enable Jetbrains setup";
    rider = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Jetbrains C# IDE";
    };
    webstorm = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Jetbrains Web IDE";
    };
    clion = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Jetbrains C/C++ IDE";
    };
    goland = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Jetbrains Go IDE";
    };
    phpstorm = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Jetbrains PHP IDE";
    };
    datagrip = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Jetbrains Database Manager";
    };
    rustrover = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Jetbrains Rust IDE";
    };
    ideau = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Jetbrains Java/Kotlin IDE";
    };
  };
}
