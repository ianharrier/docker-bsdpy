# docker-bsdpy

Dockerized BSDPy

### Contents

* [About](#about)
* [How-to guides](#how-to-guides)
    * [Installing](#installing)
    * [Upgrading](#upgrading)
    * [Uninstalling](#uninstalling)

## About

This repo uses [Docker](https://www.docker.com) and [Docker Compose](https://docs.docker.com/compose/) to automate the deployment of [BSDPy](https://github.com/bruienne/bsdpy).

The images in this repo are based on Alpine Linux, keeping the overall size to a minimum.

## How-to guides

*Note: some of the commands in these guides may require root access to your system. If that is the case, either run the commands while logged in to the root account, or simulate a login to the root account using `sudo -i`. Due to the way environment variables are passed on some systems, typing `sudo` before each command is __not__ a supported method of running the commands in these guides with root access.*

### Installing

1. Ensure the following are installed on your system:

    * [Docker](https://docs.docker.com/engine/installation/)
    * [Docker Compose](https://docs.docker.com/compose/install/) **Warning: [installing as a container](https://docs.docker.com/compose/install/#install-as-a-container) is not supported.**
    * `git`

2. Clone this repo to a location on your system. *Note: in all of the guides on this page, it is assumed the repo is cloned to `/srv/docker/bsdpy`.*

    ```shell
    git clone https://github.com/ianharrier/docker-bsdpy.git /srv/docker/bsdpy
    ```

3. Set the working directory to the root of the repo.

    ```shell
    cd /srv/docker/bsdpy
    ```

4. Create the `.env` file using `.env.template` as a template.

    ```shell
    cp .env.template .env
    ```

5. Using a text editor, read the comments in the `.env` file, and make modifications to suit your environment.

    ```shell
    vi .env
    ```

6. Start BSDPy in the background.

    ```shell
    docker-compose up -d
    ```

7. Upload your NetBoot images to the `volumes/nbi` subdirectory. If you need to host other files, they can be uploaded to the `volumes/content` subdirectory. NetBoot images are published at `http://<Docker-host-IP>/nbi/`, and other content is published at `http://<Docker-host-IP>/content/`.

8. Restart the application stack to fix the file permissions on the uploaded files.

    ```shell
    docker-compose restart
    ```

### Upgrading

**Warning: the upgrade process will immediately stop and upgrade the current production environment. The application stack will be unavailable while it is being upgraded.**

1. Set the working directory to the root of the repo.

    ```shell
    cd /srv/docker/bsdpy
    ```

2. Run the upgrade script.

    ```shell
    ./scripts/app-upgrade.sh
    ```

### Uninstalling

1. Set the working directory to the root of the repo.

    ```shell
    cd /srv/docker/bsdpy
    ```

2. Remove the application stack.

    ```shell
    docker-compose down
    ```

3. Delete the repo. **Warning: this step is optional. If you delete the repo, all of your BSDPy data, including NetBoot images and other content, will be lost.**

    ```shell
    rm -rf /srv/docker/bsdpy
    ```
