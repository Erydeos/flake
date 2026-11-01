{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/26.05";

    hyprland.url = "github:hyprwm/Hyprland";

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    quickshell = {
      # add ?ref=<tag> to track a tag
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";

      # THIS IS IMPORTANT
      # Mismatched system dependencies will lead to crashes and other issues.
      inputs.nixpkgs.follows = "nixpkgs";
    };

    clip-studio-paint = {
        url = "github:h-banii/clip-studio-paint-nix";
        inputs.nixpkgs.follows = "nixpkgs";
        inputs.nixpkgs-stable.follows = "nixpkgs-stable";
      };

    zen-browser.url = "github:0xc000022070/zen-browser-flake";


    matugen = {
      url = "github:/InioX/Matugen";
    };

    yazi = {
      url = "github:sxyazi/yazi";
    };

    nix-alien.url = "github:thiagokokada/nix-alien";

  };

  outputs = { self, nixpkgs, ...}@inputs:
   let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    in
    {

      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/default/configuration.nix
          inputs.home-manager.nixosModules.default
          {
            nixpkgs.config.permittedInsecurePackages = [
              "electron-39.8.10"
            ];
          }
        ];
      };
    };
}
