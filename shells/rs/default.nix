{ ... }:

{
  perSystem =
    { pkgs, ... }:
    {
      devShells.rs = pkgs.mkShell {
        buildInputs = with pkgs; [
          cargo
          rustc
          rustfmt
          clippy
          glib
        ];

        nativeBuildInputs = with pkgs; [
          pkg-config
        ];

        RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";

        shellHook = ''
          echo "Rust dev shell is ready !"
        '';
      };
    };
}
