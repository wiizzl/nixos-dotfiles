{ ... }:

{
  perSystem =
    { pkgs, ... }:
    {
      devShells.maui = pkgs.mkShell {
        buildInputs = with pkgs; [
          dotnetCorePackages.sdk_9_0-bin
          dotnetCorePackages.runtime_9_0-bin
          dotnetPackages.Nuget
        ];

        postInstall = ''
          if [ ! -w "$HOME" ]; then
            export HOME=$(mktemp -d)
          fi

          $out/bin/dotnet workload install maui-android
        '';

        shellHook = ''
          echo "C# + MAUI dev shell is ready !"
        '';
      };
    };
}
