# note that you need to enable flake 
# and switching your system with "sudo nixos-rebuild switch --flake /etc/nixos/#HOSTNAME"
{
  description = "Minimal flake for unstable";
  inputs = {
  nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable"; 
  #guix-overlay.url = "github:foo-dogsquared/nix-overlay-guix";
  };
  outputs = { self, nixpkgs }: 
  let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
       
      config = {
        allowUnfree = true;
      };
    };
    in
    {
    nixosConfigurations = {
      HOSTNAME = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit system; };
        modules = [
            ./configuration.nix
            ];
         
      };
    };
  };
}


