// Configure the Google Cloud provider
provider "google" {
  credentials = file("kubernetes-practice-db1b1efd7863.json")
  project     = "kubernetes-practice-db1b1efd7863"
  region      = "us-west1"
  version     = "~> 3.51"
}
