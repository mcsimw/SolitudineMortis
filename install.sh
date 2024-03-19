#!/usr/bin/env bash
set -e
while true; do
    read -rp "Which host to install? (failbox / eldritch / cacodaemoniacal / phantasmagoric): " hostname
	case $hostname in
		failbox|eldritch|cacodaemoniacal|phantasmagoric ) break;;
		* ) echo "Invalid host. Please select a valid host.";;
	esac
done
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko "./compootuers/$hostname/disks/a.nix"
sudo install -o 1000 -g 100 -d /mnt/persist/home/mcsimw && sudo chown -R 1000:100 /mnt/mnt/a
sudo nixos-install --no-root-passwd --flake .#$hostname
