Mediawiki deployment on Kubernetes using Helm chart.

My Setup:
Docker image: amitghanwat/mediawiki:v4
Kubernetes cluster: AKS

Approach:
Step 1:
Initially I deployed the mediawiki application & database on a Azure VM, there were some errors related to Auto-indexing & php-fpm. Post resolving them I wa sable to access the mediawiki site on the VM's Pulic IP and setup the DB & place the LocalSettings.php file in the appropriate directory.

Step 2:
Defined Docker Files based on the steps I followed while setting up the app & db manually on the VM.
Before going to K8s i tested the image by creating docker containers.
There were some errors related to Auto-indexing & php-fpm. Post resolving them I was able tocaccess the mediawiki site on the VM's Pulic IP.(http://publicIP:8080/mediawiki/)

Step3:
Created Dockerfile for DB, the docker image creation was failing for rhel base OS error: could not fnd packages mariadb-server, maridb.
Tried with centos& ubuntu as base os, image was created successfully & also created docker containers but post logging into the container, the db login command (mysql) was not recognizable on any base os container.
There were no errors in the container.

Step4:
Created a AKS cluster. deployed the Helm chart by updating the values in values.yaml file.
pods deployed via helm have the autoindexing error.
but when i deploy the same image using "kubectl run my-pod --image=amitghanvat/mediawiki:v4 --port=8080"
The pod is in ready state & the mediawiki page is accessible when i log into the pod.



