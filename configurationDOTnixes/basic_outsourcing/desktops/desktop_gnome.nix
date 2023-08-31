{ config, pkgs, lib, ... }:

{
	
services.xserver.displayManager.gdm.enable = true;
services.xserver.desktopManager.gnome.enable = true;

environment.systemPackages = with pkgs; [
	gnome.gnome-tweaks
        gnome.gnome-tweaks
	gnomeExtensions.captivate
	gnomeExtensions.pop-shell
  	gnomeExtensions.dash-to-dock
  	gnomeExtensions.desktop-cube
  	gnomeExtensions.clipman
  	gnomeExtensions.tray-icons-reloaded
  	pkgs.gnome.gnome-boxes 
	timeshift

];

}
