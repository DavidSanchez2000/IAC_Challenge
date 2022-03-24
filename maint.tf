terraform {
  backend "remote"{
      hostname = var.hostname
      organization = var.organization

    workspaces {
      name = var.name_workspace
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

resource "google_compute_network" "iac-vpc" {
    name = var.name_vpc
    auto_create_subnetworks = false
  
}

resource "google_compute_subnetwork" "iac-subnet" {
    name = var.name_subnet
    ip_cidr_range = var.ip_range
    network = google_compute_network.iac-vpc.self_link
    region = var.region
    private_ip_google_access = false  
}

resource "google_compute_instance" "vm_instance" {
    name = var.name
    zone = var.zone
    machine_type = var.vm_type
    allow_stopping_for_update = true
  


    boot_disk {
        initialize_params {
            image = var.vm_image
        }

    }

    network_interface {
        subnetwork = google_compute_subnetwork.iac-subnet.name
        access_config{}
    }

    metadata_startup_script = file("script.sh")
}

resource "google_compute_firewall" "ssh" {
    name = var.name_fw
    network = google_compute_network.iac-vpc.self_link
    source_ranges = ["0.0.0.0/0"]
    allow{
        protocol = "tcp"
        ports = ["22","80"]
    }
}