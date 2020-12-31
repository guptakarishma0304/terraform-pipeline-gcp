// Configure the Google Cloud provider
provider "google" {
  //credentials = file("kubernetes-practice-db1b1efd7863.json")
  project     = "kubernetes-practice-db1b1efd7863"
  region      = "us-west1"
  version     = "~> 3.51"
}

// Terraform plugin for creating random ids
//resource "random_id" "instance_id" {
 //byte_length = 8
//}

// A single Compute Engine instance
resource "google_compute_instance" "default" {
 name         = "flask-vm-terraform"
 machine_type = "f1-micro"
 zone         = "us-central1-a"

 boot_disk {
   initialize_params {
     image = "debian-cloud/debian-9"
   }
 }

// Make sure flask is installed on all new instances for later steps
 metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq build-essential python-pip rsync; pip install flask"

 network_interface {
   network = "default"

   access_config {
     // Include this section to give the VM an external ip address
   }
 }
}
