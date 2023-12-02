# code-with-quarkus

1. Prepare google bucket for terraform state preservation:
   
   ```shell
      gcloud storage buckets create gs://michal-pasinski-tf-state
   ```
   
2. Build project `./mvnw package`
2. create cluster `gcloud container clusters create sample-cluster`
3. create global loadbalancer `gcloud compute addresses create quarkus-quickstart --global`
   this loadbalancer will be used later on in igress resource `kubernetes.io/ingress.global-static-ip-name: "quarkus-quickstart"`
4. setup kubectl with `gcloud container clusters get-credentials istio-security-demo --region=us-central1-f`
5. create interal docker registry (can be done with terraform as well)

   ```
   gcloud artifacts repositories create quickstart-docker-repo --repository-format=docker \
       --location=us-central1 --description="Docker repository"
   ```
   
6. build docker image and push it to registry `gcloud builds submit --region=us-central1 --tag us-central1-docker.pkg.dev/halogen-honor-403909/quickstart-docker-repo/quickstart-image:tag1`
7. deploy resources via helm: `helm install quarkus-getting-started quarkus-getting-started`
8. check ip address of your igress resource via `kubectl describe ingress minimal-ingress`
9. call your app using ip.address:80
