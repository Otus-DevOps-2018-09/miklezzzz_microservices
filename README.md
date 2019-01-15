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
HW16: Self study
++++++++++++++++++++++++++++

- GitlabCI CE was installed (Docker+Omnibus) and configured.

- Example project was created to test CI/CD pipelines and runners.

- Reddit app source code was added to repository to perform some basic tests over it.

- Simple test was defined to demonstrate how CI/CD pipeline works.

- Example project notifications were intergrated with Slack chat via webhooks (https://devops-team-otus.slack.com/messages/CDABTQYMR/).

- Basic infrastructure (terraform + ansible) was defined and test to provide a scalable number of Gitlab CI runners in Google cloud.

++++++++++++++++++++++++++++
HW17: Self study
++++++++++++++++++++++++++++

- GitlabCI configuration was tuned up to accept connections over SSL. GitlabCI local Registry support was also enabled.

- GitlabCI pipelines were extended by means of variuis selectors like a "only/except/when".

- A couple of dynamic environments was defined in pipelines.

- "build_server" step was added into "build" stage in order to create 'sandbox' server with the Docker running inside (via gcloud utility).

- "deploy_application" step was added into "build" stage in order to build and push Docker container with Reddit application into GitlabCi Registry from where it rolls out onto 'sandbox' server. ( via ansible + gce.py )

- "delete_server" step was added into "build" stage to delete 'sandbox' server after all (manually).

++++++++++++++++++++++++++++
HW18: Self study
++++++++++++++++++++++++++++

- Dockerized Prometheus was configured to monitor microservices health status.

- Node exporter container was used to monitor the status of the docker-machine.

- Percona mongodb exporter container was used to monitor various mongodb metrics of the post_db microservice.

- Blackbox exporter container was configured and used to perform basic external checks (like http response codes, icmp probes, a tcp port open/closed status) of the microservices.

- The makefile was added to build and push microservices images. It uses Dockerfiles located in src/* directories.

Refs to the DockerHub reps:

https://cloud.docker.com/repository/docker/miklezzzz/prometheus
https://cloud.docker.com/repository/docker/miklezzzz/comment
https://cloud.docker.com/repository/docker/miklezzzz/post-py
https://cloud.docker.com/repository/docker/miklezzzz/ui

++++++++++++++++++++++++++++
HW19: Self study
++++++++++++++++++++++++++++

- Docker-compose.yml file was splitted up to two files: one for microservices and another for monitoring tools.

- A Docker container with cAdvisor monitoring tool from Google was deployed and prepared along with Prometheus to collect docker containers stats. Also, the Docker host's stats can be collected too.

- A Docker container with Grafana was deployed as a vizualisation part of our monitoring system with neat WEB UI. Prometheus database was assigned as a default datasource for Grafana. Few dashboards were imported/created for testing purposes like monitoring and observing application busines metrics.

- Alertmanager for Prometheus was deployed and configured to provide an alerting part (via slack webhooks) of our monitoring systsem.

- Makefile from previous HW was enhanced: now it rebuilds (on update) and pushes all related docker images into Docker Hub. (and it looks pretty messy)

- Docker host was configured as a Prometheus target in order to collect it stats. However, it can't provide as much useful metrics as cAdvisor can. Despite of this, an example dashboard for Grafana named DockerEngineIntegratedMetrics.json was created and placed into dashboards directory.

- Dockerized Telegraf monitoring tool was configured to obtain and export Docker's Engine host statistics. There are much more useful metrics about Docker that can be obtained, comparing to the integrated target. But still not enough to put up a challenge on cAdvisor.

- Few additional alerts were added to the Alertmanager: high CPU usage per a container (over 40%), high UI response time (95th percentile), too many simultaneous requests to "new comment".

- Alertmanager was configured to send notifications via the Sendgrid email sender service provider.

- Grafana datasources and dashboards auto provisioning was configured.

- Frodenas stackdriver exporter for the Prometheus was used to obtain a GCE instance stats like cpu/diskIO/network usage from the Google Stackdriver. 

- A couple of self made business metrics was introduced: separate votes counters to observe user activity/app misbehaving, total number of unique usernames used to comment and total number of unique emails used to comment.

- Trickster the caching proxy for Grafana was configured and deployed.

- Openshift/Autoheal the auto-heal service was configured (along with Alertmanager) to accept notifications from Alertmanager (via webhook) and execute Ansible/AWX templates (by means of the AWX REST api).

- Dockerized Ansible/AWX instance was deployed and configured to accept Auto-Heal notifications and execute simple Ansible play books in order to revive failed services (containers).


++++++++++++++++++++++++++++
HW20: Self study
++++++++++++++++++++++++++++

- The microservices' source code was updated to support logging feature.

- EFK stack (Elastic/FluentD/Kibana) was deployed as a centralized logging system.

- A Docker logging driver for Post and UI services was changed to "fluentd".

- Fluentd instance was configured with filters to parse JSON-formatted Post's logs and unstructured logs from UI service.

- Kibana WEB UI was explored to understand how to perform search and filtering.

- Zipkin the distributed tracing system was deployed and microservices were reconfigued with an environment variable to support tracing.

- Fake bug in Post's service code was traced down and remediated by powerful "#".

