{ ... }:

{
  perSystem =
    { pkgs, ... }:
    {
      packages.default = pkgs.rustPlatform.buildRustPackage {
        name = "my-app";
        src = ./.;
        buildInputs = with pkgs; [ glib ];
        nativeBuildInputs = with pkgs; [ pkg-config ];
        cargoHash = pkgs.lib.fakeHash;
      };

      devShells.rust = pkgs.mkShell {
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

        env.RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
      };
    };
}
