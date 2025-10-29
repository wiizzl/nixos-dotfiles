{ pkgs, ... }:

{
  go = pkgs.mkShell {
    buildInputs = with pkgs; [
      go
    ];

    shellHook = ''
      echo "Go dev shell is ready !"
    '';
  };
}
