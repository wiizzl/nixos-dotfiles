{
  description = "My garden of configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake/beta";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    nixcord.url = "github:KaylorBen/nixcord";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
  };

  outputs =
    {
      flake-parts,
      nixpkgs,
      self,
      ...
    }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      imports = [ ./shells/import.nix ];
      flake =
        let
          lib = nixpkgs.lib.extend (
            self: super: {
              extraMkOptions = import ./lib {
                inherit inputs;
                lib = self;
              };
            }
          );

          makeNixosSystem =
            configPath: system:
            nixpkgs.lib.nixosSystem {
              inherit system;
              specialArgs = { inherit inputs lib; };
              modules = [ configPath ];
            };
        in
        {
          nixosConfigurations = {
            desktop = makeNixosSystem ./hosts/desktop/configuration.nix "x86_64-linux";
          };
        };
    };
}
