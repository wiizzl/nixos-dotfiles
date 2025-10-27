{ ... }:

{
  perSystem =
    { pkgs, ... }:
    {
      devShells.js = pkgs.mkShell {
        buildInputs = with pkgs; [
          nodejs
          bun
          yarn
          pnpm
        ];
      };
    };
}
