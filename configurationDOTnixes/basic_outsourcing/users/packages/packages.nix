{ config, pkgs, lib, ... }:

{

# ZSH
programs.zsh.enable = true;

programs.gnupg.agent = {
  enable = true;
  enableSSHSupport = true;
};

environment.systemPackages = with pkgs; [
  vim
  wget
  ##For PC
  #mullvad-vpn
  #tailscale
  #cudaPackages.cudatoolkit
  #vulkan-tools
  flatpak
  gh
  distrobox
  podman
  timeshift
  vscodium
];

#Virtual
 virtualisation = {
    podman = {
      enable = true;
      dockerCompat = true;
      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.dnsname.enable = true;
  	};
  };

#Container
environment.etc."/containers/containers.conf".text = "";


}
