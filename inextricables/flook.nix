{ inputs, ... }: {
  flake.nixosModules = {
    inextricables-filesystems = import ./filesystems.nix;
    inextricables-nix-nixpkgs = import ./nix-nixpkgs.nix { inherit inputs; };
    inextricables-install-home-manager = import ./install-home-manager.nix;
  };
}
