# basic Config with more outsouring
{ config, pkgs, ... }:

let
	unstable = import <nixos-unstable> {};
in
{
nixpkgs.config.allowUnfree = true;
imports =
  [
    system/bootloader.nix
    system/hardware-configuration.nix
    system/nvidia.nix
    desktops/desktop_common.nix
    desktops/desktop_gnome.nix
    packages.nix
    users/username.nix
  ];
   
  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  }; 
  # Automatic Garbage Collection
  nix.gc = {
   automatic = true;
   dates = "weekly";
   options = "--delete-older-than 7d";
        };

}
