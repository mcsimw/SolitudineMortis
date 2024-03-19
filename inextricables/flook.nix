{ inputs, ... }: {
  flake.nixosModules = {
    inextricables-filesystems = import ./filesystems.nix;
    inextricables-installhomemanager = import ./install-homemanager.nix;
    inextricables-nix-nixpkgs = import ./nix-nixpkgs.nix;
  };
}

