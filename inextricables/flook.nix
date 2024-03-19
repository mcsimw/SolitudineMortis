{ inputs, ... }: {
  flake.nixosModules = {
    inextricables-filesystems = import ./filesystems.nix;
    inextricables-installhomemanager = import ./home-manager-install.nix;
    inextricables-nix-nixpkgs = import ./nix-nixpkgs.nix;
  };
}

