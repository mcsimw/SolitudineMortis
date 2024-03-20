{ inputs, ... }:
let
  foreignInextricables = [
    inputs.disko.nixosModules.disko
    inputs.home-manager.nixosModules.home-manager
  ];
  Inextricables = with inputs.self.nixosModules;
    [
      inextricables-filesystems
      inextricables-nix-nixpkgs
      inextricables-install-home-manager
    ];
  systemGenesis = args:
    (inputs.nixpkgs.lib.nixosSystem ((builtins.removeAttrs args [ "hostName" ])
      // {
        specialArgs = { inherit inputs; } // args.specialArgs or { };
        modules =
          [ ./${args.hostName} { networking = { inherit (args) hostName; }; } ]
          ++ Inextricables ++ foreignInextricables ++ (args.modules or [ ]);
      }));
in {
  flake.nixosConfigurations = {
    failbox = systemGenesis {
      system = "x86_64-linux";
      hostName = "failbox";
      modules = [ ./failbox/disks/a.nix ];
    };
  };
}

