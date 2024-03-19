{ inputs, ... }:
{ pkgs, lib, config, ... }: {
  nix = {
    package = pkgs.nixUnstable;
    registery.nixpkgs.flake = inputs.nixpkgs;
    nixPath = lib.singleton config.nix.settings.nix-path;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      nix-path = "nixpkgs=flake:nixpkgs";
      substituters = [ "https://nix-community.cachix.org" ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
  };
  nixpkgs.config.allowUnfree = true;
}
