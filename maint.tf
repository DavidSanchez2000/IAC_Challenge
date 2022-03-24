terraform {
  backend "remote"{
      hostname = "app.terraform.io"
      organization = "iac-exercice"

    workspaces {
      name = "IAC_Challenge"
    }
  }
}

provider "google" {
    credentials = var.GCP_SERVICES
    project = var.project
    region = var.region
    zone = var.zone
}

provider "google-beta" {
    credentials = var.GCP_SERVICES
    project = var.project
    region = var.region
    zone = var.zone
  
}

resource "google_network_vpc" "iac-vpc" {
    name = "iac-vpc"
    auto_create_subnetworks = false
  
}

resource "google_network_subnetwork" "iac-subnet" {
    name = "iac-subnet"
    ip_range = "10.0.0.0/16"
    network = google_network_vpc.iac-vpc.self_link
    region = "us-central1"
    private_ip_google_acces = false  
}

resource "google_compute_instance" "vm_instance" {
    name = var.name
    zone = var.zone
    machine_type = "f1-micro"
    allow_stopping_for_update = true
  


    boot_disk {
        initialize_params {
            image = "centos-cloud/centos-7"
        }

    }

    network_interface {
        subnetwork = google_network_subnetwork.iac-subnet.name
        acces_config{}
    }

    metadata_starup_script = file("script.sh")
}

resource "google_network_firewall" "ssh" {
    name = "ssh-rule"
    network = google_network_vpc.iac.vpc.self_link
    source_ranges = ["0.0.0.0/0"]
    allow{
        protocol = "tcp"
        ports = ["22","80"]
    }
}