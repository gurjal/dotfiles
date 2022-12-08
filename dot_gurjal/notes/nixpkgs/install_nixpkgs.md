create /nix directory and set proper permissions

install nixpkgs
	```
	$ sh <(curl -L https://nixos.org/nix/install) --no-daemon
	```
add rolling channel
	```
	$ nix-channel --add https://nixos.org/channels/nixpkgs-unstable
	$ nix-channel --update
	```
