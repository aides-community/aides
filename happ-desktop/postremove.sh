#!/bin/sh
# Refresh systemd after the unit file has been removed.
systemctl daemon-reload >/dev/null 2>&1 || true
