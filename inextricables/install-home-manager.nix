{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.mcsimw = {
      programs.home-manager.enable = true;
      home = {
        username = "mcsimw";
        homeDirectory = "/home/mcsimw";
        stateVersion = "24.05";
      };
    };
  };
}
