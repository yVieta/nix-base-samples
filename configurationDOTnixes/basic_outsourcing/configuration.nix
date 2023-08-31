# basic Config with more outsouring
{ config, pkgs, ... }:

let
	unstable = import <nixos-unstable> {};
in
{
nixpkgs.config.allowUnfree = true;
# 	
imports =
  [
    system/bootloader.nix
    system/hardware-configuration.nix
    #system/nvidia.nix
    desktops/desktop_common.nix
    desktops/desktop_gnome.nix
    packages/packages.nix
    users/username.nix
  ];

   
  #Unstable
  nixpkgs.overlays = [
    (self: super: {
       flatpak = unstable.flatpak;
       #vscodium = unstable.vscodium;
     })
  ];



}
