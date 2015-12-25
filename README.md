Just a bare nginx-php image, serving as a target for Neos code deployments with https://github.com/sfi-ru/ansible-deploy

##Usage

1. Create a container based on this image
2. Set `REPOSITORY_URL` environment variable to automatically install your Neos website distribution. Leave blank to provision manually
3. Sync persistant data with `ansible-playbook ~/ansible-deploy/sync-persistent.yml --extra-vars "SOURCE_HOST=source.host SOURCE_PORT=xxxx TARGET_HOST=target.host TARGET_PORT=xxxx" -i "i"`
