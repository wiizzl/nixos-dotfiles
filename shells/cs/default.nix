{ pkgs, ... }:

{
  cs = pkgs.mkShell {
    buildInputs = with pkgs; [
      dotnetCorePackages.sdk_9_0-bin
      dotnetCorePackages.runtime_9_0-bin
      dotnetPackages.Nuget
    ];

    shellHook = ''
      echo "C# dev shell is ready !"
    '';
  };
}
