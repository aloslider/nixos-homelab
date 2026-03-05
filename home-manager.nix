{ config, pkgs, lib, ... }:
let
  home-manager = builtins.fetchTarball https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz;
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
