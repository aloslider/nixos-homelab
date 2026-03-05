{ config, lib, pkgs, ... }:
{
  imports = [
    ./home-manager.nix
    ./hardware-configuration.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader = {
    limine = {
      enable = true;
    };
    efi.canTouchEfiVariables = true;
  };

  networking.hostName = "benq-serv";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Moscow";

  i18n = { 
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_TIME = "en_GB.UTF-8";
    };
  };

  services.xserver.xkb = {
    layout = "us,ru";
    options = "eurosign:e,caps:escape";
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  environment.systemPackages = with pkgs; [
    git
    vim
  ];

  services.openssh.enable = true;

  networking.firewall.allowedTCPPorts = [ 22 80 443 ];
  networking.firewall.allowedUDPPorts = [];

  system.stateVersion = "25.05";
}

