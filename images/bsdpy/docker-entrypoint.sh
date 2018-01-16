#!/bin/sh
set -e

echo "[I] Setting file permissions."
chmod ugo+r -R /nbi
chmod ugo+x $(find /nbi -type d)

echo "[I] Entrypoint tasks complete. Starting BSDPy."
exec "$@"
