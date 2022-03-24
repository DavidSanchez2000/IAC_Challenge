variable "GCP_SERVICES" {
  
}

variable "hostname" {
    default = "app.terraform.io"
  
}

variable "organization" {
    default = "iac-exercice"
  
}

variable "name_workspace" {
    default = "IAC_Challenge"
  
}

variable "name_vpc" {
    default = "iac-vpc"
  
}

variable "name_subnet" {
    default = "iac-subnet"
  
}

variable "ip_range" {
    default = "10.0.0.0/16"
  
}


variable "project" {
    default = "iac-challenge-345123"
  
}

variable "region" {
    default = "us-central1"
  
}

variable "zone" {
    default = "us-central1-a"
  
}

variable "name" {
    default = "iac-vm"
  
}

variable "vm_type" {
    default = "f1-micro"
}

variable "vm_image" {
    default = "centos-cloud/centos-7"
  
}

variable "name_fw" {
    default = "ssh-rule"
  
}