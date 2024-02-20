{
  description = "My nix config";

  inputs = {
    nix-colors.url = "github:misterio77/nix-colors";

    nixvim = {
      url = "github:nix-community/nixvim";
      # If using a stable channel you can use `url = "github:nix-community/nixvim/nixos-<version>"`
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # change to github:nixos/nixpkgs/nixos-unstable for unstable
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      # change to github:nix-community/home-manager for unstable
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix.url = "github:the-argus/spicetify-nix";
  };
  outputs = inputs@{ self, nixpkgs, ... }: {
    nixosConfigurations = let user = "gabbar";
    in {
      # update with `nix flake update`
      # rebuild with `nixos-rebuild switch --flake .#dev`
      default = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";

        specialArgs = {
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs system user;
        };

        modules = [
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs system user; };

              users.${user} = {
                imports = [
                  inputs.spicetify-nix.homeManagerModule
                  inputs.nix-colors.homeManagerModule
                  inputs.nixvim.homeManagerModules.nixvim
                  ./home.nix
                ];

                home = {
                  username = user;
                  homeDirectory = "/home/${user}";
                  # do not change this value
                  stateVersion = "23.11";
                };

                # Let Home Manager install and manage itself.
                programs.home-manager.enable = true;
              };
            };
          }
          ./configuration.nix
        ];
      };
    };
  };
}
