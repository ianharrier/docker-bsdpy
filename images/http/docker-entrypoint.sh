#!/bin/sh
set -e

echo "[I] Setting file permissions."
chmod ugo+r -R /var/www/localhost/htdocs/content
chmod ugo+x $(find /var/www/localhost/htdocs/content -type d)

echo "[I] Entrypoint tasks complete. Starting httpd."
exec "$@"
