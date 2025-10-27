{
  description = "My garden of configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # flake-parts.url = "github:hercules-ci/flake-parts"; # TODO: use it
    home-manager = {
      url = "github:nix-community/home-manager";
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
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    nixcord.url = "github:KaylorBen/nixcord";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
  };

  outputs =
    { nixpkgs, ... }@inputs:

    let
      makeNixosSystem =
        configPath:
        nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [ configPath ];
        };
    in
    {
      nixosConfigurations = {
        desktop = makeNixosSystem ./hosts/desktop/configuration.nix;
        laptop = makeNixosSystem ./hosts/laptop/configuration.nix;
      };
    };
}
