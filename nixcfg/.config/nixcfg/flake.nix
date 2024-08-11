{
  description = " s-takoor's darwin system flake ";

  # dependencies
  inputs = {
    # import nixpkgs unstable branch
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    # import home-manager and follow nixpkgs
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # import nix-darwin and follow nixpkgs
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # import nixvim and follow nixpkgs
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  # flake outputs
  outputs = { self, nix-darwin, home-manager, nixvim, nixpkgs }@inputs:
    let
      # -- system settings -- #
      hostname = "MacBook-Air";
      system = "aarch64-darwin";

      # -- packages settings -- #
      pkgs = import nixpkgs {
        inherit system;
        # TODO :: overlays allows customizing the `nixpkgs` attribute set
        overlays = [ ];
      };
      # -- user settings -- #
      home = "/Users/st/";
      username = "st";
    in {
      # -- custom settings -- #
      # define `macos` configuration for `MacBook-Air`
      darwinConfigurations."${hostname}" = nix-darwin.lib.darwinSystem {
        inherit system pkgs;
        specialArgs = { inherit home hostname inputs username; };
        modules = [
          ./modules/darwin/configuration.nix
          home-manager.darwinModules.home-manager
        ];
      };

      # expose the package set, including overlays, for convenience.
      darwinPackages = self.darwinConfigurations."${hostname}".pkgs;

      # development environment
      devShells.${system} = {
        default = import ./modules/devshell/shell.nix {
          inherit pkgs;
        };
      };
    };
}
