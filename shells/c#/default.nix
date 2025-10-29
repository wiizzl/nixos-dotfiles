{ ... }:

{
  perSystem =
    { pkgs, ... }:
    {
      devShells.rs = pkgs.mkShell {
        buildInputs = with pkgs; [
          dotnetCorePackages.sdk_9_0-bin
        ];

        postInstall = ''
          if [ ! -w "$HOME" ]; then
            export HOME=$(mktemp -d)
          fi

          $out/bin/dotnet workload install maui
        '';

        shellHook = ''
          echo "C# dev shell is ready !"
        '';
      };
    };
}
