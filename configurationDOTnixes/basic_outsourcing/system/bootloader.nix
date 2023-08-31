{ config, pkgs, lib, ... }:

{

# Bootloader.
boot.loader.systemd-boot.enable = true;
boot.loader.efi.canTouchEfiVariables = true;
boot.loader.efi.efiSysMountPoint = "/boot/efi";
boot.kernelPackages = pkgs.linuxPackages_zen;    

system.stateVersion = "22.11";

# Set your time zone.
time.timeZone = "Europe/Berlin";

# Select internationalisation properties.
i18n.defaultLocale = "en_US.UTF-8";

i18n.extraLocaleSettings = {
  LC_ADDRESS = "de_DE.UTF-8";
  LC_IDENTIFICATION = "de_DE.UTF-8";
  LC_MEASUREMENT = "de_DE.UTF-8";
  LC_MONETARY = "de_DE.UTF-8";
  LC_NAME = "de_DE.UTF-8";
  LC_NUMERIC = "de_DE.UTF-8";
  LC_PAPER = "de_DE.UTF-8";
  LC_TELEPHONE = "de_DE.UTF-8";
  LC_TIME = "de_DE.UTF-8";
};

nix = {
  settings = {
    #warn-dirty = false;
    auto-optimise-store = true;
    experimental-features = [ "nix-command" "flakes" ];
  };

  #Automatic Garbage Collection
  gc = {
   automatic = true;
   dates = "weekly";
   #options = "--delete-older-than 7d";
        };
};
}
