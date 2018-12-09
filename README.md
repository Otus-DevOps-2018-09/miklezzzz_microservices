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

++++++++++++++++++++++++++++
HW14: Self study
++++++++++++++++++++++++++++

- Reddit App was segregated into microservices

- Each microservice was placed into different container

- Microservices communicate with their counterparts by means of network aliases (much like ad-hoc DNS records)

- To get smaller containers we should rewrite Dockerfiles. We have to use alpine linux, install only necessary packages and delete caches after all.

- Docker volume was created to add statefulness to MongoDB microservice.

++++++++++++++++++++++++++++
HW15: Self study
++++++++++++++++++++++++++++

- Different network types for Docker were tested.

- Docker-Compose utility was installed and used in conjunction with an yml configuration file to perform a complex deployment of microservices of Reddit App.

- Docker-Compose declarative yml file was parametirezed to use environment variables.

- "Each configuration has a project name. If you supply a -p flag, you can specify a project name. If you don’t specify the flag, Compose uses the current directory name."

- docker-dompose.yml file was modified to use bind volumes (to change application code on fly) and "command" parameter to override Dockerfiles CMD arguments on build.

++++++++++++++++++++++++++++
HW15: Self study
++++++++++++++++++++++++++++

- GitlabCI CE was installed (Docker+Omnibus) and configured.

- Example project was created to test CI/CD pipelines and runners.

- Reddit app source code was added to repository to perform some basic tests over it.

- Simple test was defined to demonstrate how CI/CD pipeline works.

- Example project notifications were intergrated with Slack chat via webhooks (https://devops-team-otus.slack.com/messages/CDABTQYMR/).

- Basic infrastructure (terraform + ansible) was defined and test to provide a scalable number of Gitlab CI runners in Google cloud.

