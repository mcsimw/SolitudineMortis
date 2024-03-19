{ inputs, ... }: {
  flake.nixosModules = {
    inextricables-home-manager-install = import ./home-manager-install.nix;
    inextricables-nix-nixpkgs = import ./nix-nixpkgs.nix;
  };
}

