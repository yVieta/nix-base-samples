{ config, pkgs, lib, ... }:

{
	
services.xserver.displayManager.gdm.enable = true;
services.xserver.desktopManager.gnome.enable = true;

environment.systemPackages = with pkgs; [
	# If you like gnome extenmsion for you gnome
	gnome.gnome-tweaks
  	gnomeExtensions.clipman
  	gnomeExtensions.tray-icons-reloaded
];

}
