# if you are using nvidia
{ config, pkgs, ... }:

{
	
# Nvidia
services.xserver.videoDrivers = [ "nvidia" ];
hardware.opengl.enable = true;
hardware.opengl.driSupport32Bit = true;
hardware.pulseaudio.support32Bit = true;
hardware.nvidia.powerManagement.enable = true;
hardware.nvidia.modesetting.enable = true;  

}
