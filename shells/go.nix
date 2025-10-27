{
  perSystem =
    { pkgs, ... }:
    {
      devShells.go = pkgs.mkShell {
        buildInputs = with pkgs; [
          go
        ];
      };
    };
}
