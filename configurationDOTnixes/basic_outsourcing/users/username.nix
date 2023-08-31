{ config, pkgs, lib, ... }:

{

users.users.username = {
  isNormalUser = true;
  description = "Firstname Lastname";
  extraGroups = [ "networkmanager" "wheel" ];
};

}
