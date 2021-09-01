# Jenkins CICD on Kubernertes Cluster

### Prerequisite

* Setup Kubernetes with Containerd CRI
* Install helm



Add jenkins repo 

`helm repo add jenkinsci https://charts.jenkins.io`

Before installing jenkins few changes to be done on values


`helm show values jenkinsci/jenkins > jenkins.yaml`

vim jenkins.yaml

* uncomment password for jenkins
* change service type 
* specify plugins to be installed 


helm install jenkins jenkinsci/jenkins --values jenkins.yaml -n jenkins
