{ config, ... }: {
  imports = [
		./docker.nix
		./gc.nix
		./network.nix
		./openssh.nix
	];
}
