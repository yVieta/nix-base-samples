{ config, pkgs, lib, ... }:

{

# Pipewire
sound.enable = true;
hardware.pulseaudio.enable = false;
security.rtkit.enable = true;
services.pipewire = {
  enable = true;
  alsa.enable = true;
  alsa.support32Bit = true;
  pulse.enable = true;
};

# NetworkManager
networking.networkmanager.enable = true;

# Touchpad support
services.xserver.libinput.enable = true;

# Enable CUPS to print documents.
services.printing.enable = false;

# Bluetooth
hardware.bluetooth.enable = true;

#Zram
zramSwap.enable = true;


# OpenTabletDriver
hardware.opentabletdriver.enable = true;
hardware.opentabletdriver.daemon.enable = true;

# MullvadVPN
#services.mullvad-vpn.enable = true;

# Tailscale
#services.tailscale.enable = true;

# Flatpak
services.flatpak.enable = true;
xdg.portal.enable = true;
system.fsPackages = [ pkgs.bindfs ];
fileSystems = let
  mkRoSymBind = path: {
    device = path;
    fsType = "fuse.bindfs";
    options = [ "ro" "resolve-symlinks" "x-gvfs-hide" ];
  };
  aggregatedFonts = pkgs.buildEnv {
    name = "system-fonts";
    paths = config.fonts.fonts;
    pathsToLink = [ "/share/fonts" ];
  };
in {
  "/usr/share/icons" = mkRoSymBind (config.system.path + "/share/icons");
  "/usr/share/fonts" = mkRoSymBind (aggregatedFonts + "/share/fonts");
};

# Configure keymap in X11
services.xserver = {
  layout = "de";
  xkbVariant = "";
};

# Configure console keymap
console.keyMap = "de";

services.xserver.enable = true;
#services.xserver.dpi = 96;

# Fonts
 fonts.fontDir.enable = true;
#fonts.enableDefaultFonts = true;
  fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
  ];


}
