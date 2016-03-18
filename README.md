Just a bare nginx-php image, serving as a target for Neos code deployments with https://github.com/psmb/ansible-deploy

##Usage

Create a container based on this image with env variables set somehow like this:

This image supports following environment variable for automatically configuring Neos at container startup:

| Setting | Description |
|---------|-------------|
|REPOSITORY_URL|Link to Neos website distribution|
|VERSION|Git repository branch, commit SHA or release tag, defaults to `master`|
|SITE_PACKAGE|Neos website package with exported website data to be imported, optional|

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
```
