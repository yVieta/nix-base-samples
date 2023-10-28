{ config, pkgs, ... }:

{
nixpkgs.config.allowUnfree = true;
	
imports =
  [
    system/bootloader.nix
    system/hardware-configuration.nix
    system/nvidia.nix
    desktops/desktop_common.nix
    desktops/desktop_gnome.nix
    packages/packages.nix
    users/USER.nix
  ];


}
