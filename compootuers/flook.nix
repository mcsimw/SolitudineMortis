{ inputs, ... }:
let
  Inextricables = with inputs.self.nixosModules;
    [
      inextricables-installhomemanager
      inextricables-filesystems
      inextricables-nix-nixpkgs
    ];
  foreignInextricables = with inputs; [
    disko.nixosModules.disko
    impermanence.nixosModules.impermanence
    home-manager.nixosModules.home-manager
    sops-nix.nixosModules.sops
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

