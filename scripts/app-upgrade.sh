#!/bin/sh
set -e

START_TIME=$(date +%s)

echo "=== Removing currnet application stack. ========================================"
docker-compose down

echo "=== Pulling changes from repo. ================================================="
git pull

echo "=== Updating environment file. ================================================="
OLD_BSDPY_VERSION=$(grep ^BSDPY_VERSION= .env | cut -d = -f 2)
NEW_BSDPY_VERSION=$(grep ^BSDPY_VERSION= .env.template | cut -d = -f 2)
echo "[I] Upgrading BSDPy from '$OLD_BSDPY_VERSION' to '$NEW_BSDPY_VERSION'."
sed -i.bak "s/^BSDPY_VERSION=.*/BSDPY_VERSION=$NEW_BSDPY_VERSION/g" .env

echo "=== Deleting old images. ======================================================="
IMAGE_BSDPY=$(docker images ianharrier/netboot-bsdpy -q)
IMAGE_HTTP=$(docker images ianharrier/netboot-http -q)
IMAGE_TFTP=$(docker images ianharrier/netboot-tftp -q)
docker rmi $IMAGE_BSDPY $IMAGE_HTTP $IMAGE_TFTP

echo "=== Building new images. ======================================================="
docker-compose build --pull

echo "=== Starting application stack. ================================================"
docker-compose up -d

END_TIME=$(date +%s)

echo "=== Upgrade complete. =========================================================="
echo "[I] Time elapsed: $((END_TIME-START_TIME)) seconds."
