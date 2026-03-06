{ config, lib, pkgs, ... }:
{
  imports = [
    ./home-manager.nix
		./modules/system
    ./hardware-configuration.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader = {
    limine = {
      enable = true;
    };
    efi.canTouchEfiVariables = true;
  };

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
		tmux
  ];

  system.stateVersion = "25.05";
}

