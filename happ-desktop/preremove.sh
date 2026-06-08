#!/bin/sh
# Stop and disable the service only on a real removal, not on upgrade.
# $1 conventions: rpm passes "0" on final erase; deb passes "remove"/"purge".
if [ "$1" = "0" ] || [ "$1" = "remove" ] || [ "$1" = "purge" ]; then
	systemctl --no-reload disable --now happd.service >/dev/null 2>&1 || true
fi
