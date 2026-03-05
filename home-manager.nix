{ config, pkgs, lib, ... }:
let
  home-manager = builtins.fetchTarball { 
    url = "https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz";
    sha256 = "07pk5m6mxi666dclaxdwf7xrinifv01vvgxn49bjr8rsbh31syaq";
  };
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  users.users.benq.isNormalUser = true;

  home-manager = {
    useGlobalPkgs = true;
    users.benq = { pkgs, ... }: {
      home.packages = with pkgs; [
       
      ];
      home.stateVersion = "25.05";
    };
  };
}
