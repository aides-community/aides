#!/usr/bin/env bash
set -euo pipefail

RPM="${1:?Usage: $0 <package.rpm>}"
TMPDIR=$(mktemp -d)
ORIGDIR="${TMPDIR}/orig"
WORKDIR="${TMPDIR}/work"

trap 'rm -rf "$TMPDIR"' EXIT

mkdir -p "$ORIGDIR" "$WORKDIR"
rpm2cpio "$RPM" | (cd "$ORIGDIR"; cpio -idmv 2>/dev/null)
cp -r "$ORIGDIR/." "$WORKDIR/"

2to3 -wn "$WORKDIR/" 2>/dev/null

(cd "$TMPDIR" && diff -urN orig/ work/) > fix_py3.patch || true

echo "Patch written to fix_py3.patch"