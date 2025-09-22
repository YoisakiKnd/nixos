let
  userName = "ty0";
in {
  users.users.${userName} = {
    isNormalUser = true;
    extraGroups = ["wheel"];
  };

  home-manager.users.${userName} = {
    home.username = userName;
    home.homeDirectory = "/home/${userName}";
    home.stateVersion = "25.11";
  };

  userConfig = {
    userName = userName;
    homeModules = [
      "home/home"
    ];
  };

}