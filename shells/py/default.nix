{ ... }:

{
  perSystem =
    { pkgs, ... }:
    {
      devShells.py = pkgs.mkShell {
        buildInputs = with pkgs; [
          python315
          uv
        ];

        shellHook = ''
          echo "Python dev shell is ready !"
        '';
      };
    };
}
