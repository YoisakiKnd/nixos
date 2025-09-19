{...}: let
  userName = "ty0";
in {
  users.users.${userName} = {
    isNormalUser = true;
    extraGroups = ["wheel"];
  };

  userConfig = {
    userName = userName;
  };
}