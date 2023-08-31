{ config, pkgs, lib, ... }:

{

users.users.username = {
  isNormalUser = true;
  description = "Firstname Lastname";
  extraGroups = [ "networkmanager" "wheel" ];
};

users.extraUsers.username = {
 	shell = pkgs.zsh; # if you like to set a default shell theme
};

}
