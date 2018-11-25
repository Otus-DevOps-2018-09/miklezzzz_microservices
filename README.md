# miklezzzz_microservices
miklezzzz microservices repository

++++++++++++++++++++++++++++
HW12: Self study
++++++++++++++++++++++++++++

- Docker installation and basic operations

++++++++++++++++++++++++++++
HW13: Self study
++++++++++++++++++++++++++++

- Additional GCP project was created for Docker related tasks.

- Docker engine was deployed remotely in GCE instance by 'docker-machine' utility.

- Dockerfile was created to compose Reddit-app image.

- Reddit-app container was fired up from Reddit-app image on a remote docker engine via 'docker-machine'.

- Reddit-app image was pushed to the Docker Hub.

- Various test were performed with containers to understand how containers can be used/controlled/configured from CLI.

- * Terraform configuration with multiple instance support was added. Number of running instances can be controlled by -var 'instance_count = #' switch.

- * Ansible configuration with roles and plays that may be used to deploy Docker Engine and to run Reddit-app container were added.

- * Packer template with ready to go Docker Engine was prepared. Ansible provisioner was used to prepare it.

