{ config, pkgs, ... }:
{
  home-manager = {
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs; };
    users.mcsimw = {
      home-manager.enable = true;
      home = {
        username = "mcsimw";
        homeDirectory = "/home/mcsimw";
        stateVersion = "24.05"l
      };
    };
  };
}
