terraform {
  required_version = "~> 1.6.3"
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "~> 5.5.0"
    }
  }

  backend "gcs" {
    bucket = "michal-pasinski-tf-state"
    prefix = "quarkus-quickstart"
  }
}

provider "google" {
  project = "halogen-honor-403909"
  region = "us-central1"
  zone = "us-central1-f"
}