{ inputs, ... }:
let
  Inextricables = with inputs.self.nixosModules;
    [ inextricables-home-manager-install ];
  foreignInextricables = with inputs; [
    home-manager.nixosModules.home-manager
    sops-nix.nixosModules.sops
    impermanence.nixosModules.impermanence
  ];
  nixosSystemWithDefaults = args:
    (inputs.nixpkgs.lib.nixosSystem ((builtins.removeAttrs args [ "hostName" ])
      // {
        specialArgs = { inherit inputs; } // args.specialArgs or { };
        modules =
          [ ./${args.hostName} { networking = { inherit (args) hostName; }; } ]
          ++ Inextricables ++ foreignInextricables ++ (args.modules or [ ]);
      }));
in {
  flake.nixosConfigurations = {
    failbox = nixosSystemWithDefaults {
      system = "x86_64-linux";
      hostName = "failbox";
    };
  };
}

