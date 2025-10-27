{ ... }:

{
  perSystem =
    { pkgs, ... }:
    {
      devShells.python = pkgs.mkShell {
        buildInputs = with pkgs; [
          python315
          uv
        ];
      };
    };
}
