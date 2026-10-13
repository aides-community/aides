#!/bin/sh
if [ "$1" = "0" ] || [ "$1" = "remove" ]; then
	/opt/Citrix/ICAClient/util/disintegrate.sh
fi
