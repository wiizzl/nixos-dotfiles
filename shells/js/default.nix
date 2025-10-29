{ pkgs, ... }:

{
  js = pkgs.mkShell {
    buildInputs = with pkgs; [
      nodejs
      bun
      yarn
      pnpm
    ];

    shellHook = ''
      echo "JavaScript dev shell is ready !"
    '';
  };
}
