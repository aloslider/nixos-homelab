{ config, pkgs, ... }: {
  services.openssh = {
    enable = true;
		ports = [ 6969 ];
		settings = {
			PasswordAuthentication = false;
			PermitEmptyPasswords = false;
			KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
      PubkeyAuthentication = true;
		};
	};

  services.fail2ban = { 
		enable = true;
		maxretry = 3;
		bantime = "48h";
	};

	services.endlessh = {
		enable = true;
		port = 22;
    openFirewall = true;
  };

	systemd.services.endlessh = {
		wantedBy = [ "multi-user.target" ];
		after = [ "network.target" ];
	};
}
