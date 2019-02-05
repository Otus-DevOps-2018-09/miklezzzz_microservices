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

++++++++++++++++++++++++++++
HW21: Self study
++++++++++++++++++++++++++++

- Kubernetes deployments files for the Reddit application were prepared and tested.

- Kubernetes the Hard Way tutorial was completed manualy.

- Terraform configuration was prepared to deploy an appropriate cloud infrastructure.

- Ansible playbooks were prepared to perform a Kubernetes cluster configuration the same way as KtHW does.

++++++++++++++++++++++++++++
HW22: Self study
++++++++++++++++++++++++++++

- Minikube instance with VirtualBox was used to deploy Reddit application on the localhost.

- Kubectl utility was used to perform basic operations against Kubernetes cluster.

- Manifests used for deployments were supplemented with labels. Few new manifests were added: for services and for the dev namespace. All this stuff was tested with minikube.

- Google Kubernetes Engine instance with Reddit application was launched in GCP.

- ClusterRoleBinding entity was created in order to provide access to Kubernetes API for the kubernetes-dashboard user.

- Terraform configuration for GKE instance creation was prepared and test.

- ClusterRoleBinding manifest was prepared to configure the kubernetes-dashboard user with the cluster-admin role.

++++++++++++++++++++++++++++
HW23: Self study
++++++++++++++++++++++++++++

- During this homework the following Kubernetes entities were studied and test:
  1) services (ClusterIP, NodePort, LoadBalancer)
  2) kube-dns plugin
  3) ingress controller
  4) secrets and tls termination
  5) network policies
  6) volumes (emptyDir, persistentVolume, persistenVolumeClaim
  7) storageclass

- The yaml manifest named ui-secret.yml type "secret" was added to provide a certificate/private key pair used by an Ingress controller for TLS termination.

++++++++++++++++++++++++++++
HW24: Self study
++++++++++++++++++++++++++++

- Terraform configuration for GKE instance from HW22 was enhanced: an additional pool with a type "n1-standard-2" machine added to a cluster (to be able to run Gitlab).

- Helm the packet manager client/server utility for the Kubernetes was installed and used to deploy an infrastructure and services.

- A Gitlab chart for Helm was downloaded from a repository and Gitlab Omnibus instance was deployed in the Kubernetes.

- Gitlab CI/CD basic configuration was performed (variables,a group,projects, etc).

- Gitlab CI/CD pipelines were configred and tested to build and deploy Reddit application into the Kubernetes cluster.

- In order to configure multi-project pipelines a pipeline trigger was created in "reddit-deploy" project. It is used as a token value in an API call to the Gitlab API server during "deploy" stage which is triggered after "release" stage in the master branch.

- "Reddit-deploy" project pipeline was slightly modified and now it includes two "production" stages: one is for manual run (it looks like original pipeline: test->staging->manual production) and second one is for automatic run via multi-project pipelines so there is no need for "staging" phase (it looks like ui/post/comment deploy->API call->test->automatic production).

++++++++++++++++++++++++++++
HW25: Self study
++++++++++++++++++++++++++++

- Stable/Nginx-ingress controller was installed via Helm utility as an ingress controller for a cluster.

- Prometheus instance was installed with Helm utility. Prometheus targets for monitoring were discovered with the kubernetes service discovery feature.

- Kube-state-metrics and Node-Exporter services were enabled in Prometheus configuration to gather k8s cluster metrics and nodes metrics.

- Prometheus configuration was customized to sort out and adopt some metrics gathered from Reddit application services. Prometheus targets for Reddit application were rearranged into three separate jobs where each job is in charge of monitoring certain endpoints (post/comment/ui).

- Grafana instance was installed via Helm utility and some popular dashboards were imported  into it to feel yourself like a spaceship pilot.

- A couple of dashboards from previous home works were imported and parameterized to use custom variables like "namespace". Improved dashboards can be found at the "monitoring/grafana/dashboards" path.

- Prometheus was reconfigured to use the alertmanager service to notify about alerts via Slack web-hook. Also, two alert rules were added: to monitor kube-api server reachability and to ping cluster nodes ( Blackbox exporter service was installed to make it possible).

- Prometheus was reconfigured to use the alertmanager service to notify about alarms via Slack web-hook. Also, two alert rules were added: to monitor kube-api server reachability and to ping cluster nodes ( Blackbox exporter service was installed to make it works).

- EFK stack was installed and used as a logging service. 

- EFK Helm chart was created and added to the repository.

