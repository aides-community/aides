#!/bin/sh
# Refresh systemd so it sees the (new/updated) happd.service unit.
# The service is intentionally NOT enabled/started here: happd is a
# privileged daemon (root + TUN) that the GUI client manages on demand.
systemctl daemon-reload >/dev/null 2>&1 || true
