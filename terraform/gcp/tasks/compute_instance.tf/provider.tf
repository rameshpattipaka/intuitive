terraform {
 backend "gcs" {}  
}
provider "google" {
 credentials = "${file("service-account.json")}"
 project     = var.project_name
 region      = var.gcp_region
}
