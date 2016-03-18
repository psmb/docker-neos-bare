This image is based upon very robust [nginx-php image](https://github.com/million12/docker-nginx-php) by million12. It's meant to serve as a target for Neos code deployments with Ansible in the fashion of https://github.com/psmb/ansible-deploy.

Essential task of this image is to create `Settings.yaml` file with DB settings to connect to [Million12's MariaDB container](https://github.com/million12/docker-mariadb).
This `Settings.yaml` file is updated on every container restart with correct settings.

In addition, if you provide certain environment variables (documented below), it would also automatically provision the container with your website distribution, import the site package data or even automatically import persistent resources and database dump.

This image is meant to run only one website per container. We don't use Docker for code deployments, so we use one image for all of our Neos websites, as all of them use the same stack and don't need any alterations. Having only one docker image saves disk space and simplifies container management.

**WARNING: this image is created for our internal use, and is tightly coupled to our infrastructure. I would recommend to create your own image, taking inspiration from this one.**

##Usage

Create a container based on this image with env variables set somehow like this:

This image supports following environment variable for automatically configuring Neos at container startup:

| Docker env variable | Description |
|---------|-------------|
|REPOSITORY_URL|Link to Neos website distribution|
|VERSION|Git repository branch, commit SHA or release tag, defaults to `master`|
|SITE_PACKAGE|Neos website package with exported website data to be imported, optional|
|ADMIN_PASSWORD|If set, would create an `admin` user with such password|

In addition to these settings, if you place database sql dump at `Data/Persistent/db.sql`, it would automatically be imported on first container launch.

Example docker-compose.yml configuration:

```
...
web:
  image: dimaip/neos-bare:latest
  ports:
    - '80'
  links:
    - db:db
  volumes_from:
    - webdata
  environment:
    REPOSITORY_URL: 'https://github.com/neos/neos-development-distribution'
    SITE_PACKAGE: 'TYPO3.NeosDemoTypo3Org'
    VERSION: '2.0'
    ADMIN_PASSWORD: 'password'
```
