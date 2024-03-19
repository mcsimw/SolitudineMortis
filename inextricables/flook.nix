{ inputs, ... }: {
  flake.nixosModules = {
    inextricables-filesystems = import ./filesystems.nix;
    inextricables-nix-nixpkgs = import ./nix-nixpkgs.nix { inherit inputs; };
  };
}

