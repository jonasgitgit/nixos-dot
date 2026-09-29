{
  description = "NixOS";
  inputs = { 
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf.url = "github:notashelf/nvf";
  }; 

  outputs = { self, nixpkgs, home-manager, nvf, ...}:{
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          nixpkgs.config.allowUnfree = true;
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
	    extraSpecialArgs = {
	      inherit nvf;
	    };
            users.jonas = import ./home.nix;
            backupFileExtension = "backup";
          };
        }
      ];
    };
  };
}
