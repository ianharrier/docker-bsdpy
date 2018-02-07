#!/bin/sh
set -e

echo "[I] Setting file permissions."
chmod ugo+r -R /var/www/localhost/htdocs/content
find /var/www/localhost/htdocs/content -type d -exec chmod ugo+x {} +

echo "[I] Entrypoint tasks complete. Starting httpd."
exec "$@"
