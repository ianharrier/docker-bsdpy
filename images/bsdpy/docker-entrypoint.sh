#!/bin/sh
set -e

echo "[I] Setting file permissions."
chmod ugo+r -R /nbi
find /nbi -type d -exec chmod ugo+x {} +

echo "[I] Entrypoint tasks complete. Starting BSDPy."
exec "$@"
