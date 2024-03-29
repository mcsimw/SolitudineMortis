{ config, lib, pkgs, ... }:

{

  services.openssh.enable = true;
  boot.initrd.availableKernelModules = [ "ata_piix" "ahci" "sd_mod" "sr_mod" ];
  networking.useDHCP = lib.mkDefault true;
  networking.hostId = "b5fe483b";

  virtualisation.virtualbox.guest.enable = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "Canada/Eastern";

  i18n.defaultLocale = "en_US.UTF-8";
  console = { keyMap = "us"; };

  users = {
    mutableUsers = false;
    users = {
      mcsimw = {
        isNormalUser = true;
        extraGroups = [ "wheel" ];
        initialPassword = "1";
        uid = 1000;
      };
      root.initialPassword = "1";
    };
  };

  networking.firewall.enable = false;
  programs.git.enable = true;
  home-manager.users.mcsimw.programs.git = {
    enable = true;
    userName = "Maor Haimovitz";
    userEmail = "maor@mcsimw.com";
  };

  boot.initrd.systemd.enable = true;
  system.stateVersion = "24.05";
  security = {
    polkit.enable = true;
   # sudo.enable = false;
    doas = {
      enable = true;
      extraRules = [{
        users = [ "mcsimw" ];
        noPass = true;
        keepEnv = true;
      }];
    };
  };

}
