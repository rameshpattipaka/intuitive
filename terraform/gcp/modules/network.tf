resource "google_compute_network" "sample_vpc" {
  name = var.vpc_name
}


resource "google_compute_subnetwork" "sample_subnet" {
  name          = var.subnet_name
  network       = google_compute_network.sample_vpc.name
  ip_cidr_range = var.cidr_range 
  region        = var.region  
}

resource "google_compute_network_interface" "sample_nic" {
  count = var.nic_count
  name  = "${var.nic_name_region_prefix}-${var.nic_name}-0${count.index+1}"
  network = google_compute_network.sample_vpc.name  
}
