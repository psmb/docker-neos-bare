Just a bare nginx-php image, serving as a target for Neos code deployments with https://github.com/sfi-ru/ansible-deploy

##Usage

1. Create a container based on this image
2. Deploy code into container with `ansible-playbook destructive-deploy-persistent.yml`
3. Setup CircleCI or manually deploy code with `ansible-playbook deploy.yml`

