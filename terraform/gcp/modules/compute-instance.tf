resource "google_compute_instance" "web_instance" {
  count         = var.instance_count
  project =       var.project_name
  name           = "${var.instance_name_region_prefix}-${var.instance_name}-0${count.index+1}"
  machine_type = var.machine_type
  deletion_protection = var.del_protect  
  zone = var.zone
  labels = var.instance_label
  allow_stopping_for_update = true
  
boot_disk {
    initialize_params {
      image = ""debian-cloud/debian-9""
      size = "130"
    }
  }

network_interface {
    network = var.network
    subnetwork =  var.subnetwork
  }
service_account {
    email  = var.developer_service_account_email
    scopes = ["cloud-platform"]
  }
}
resource "google_compute_disk" "data_disk" {
  name = var.data_disk_name
  size = var.persistant_disk_size
  
  type = var.persistant_disk_type
}
resource "google_compute_instance_attach_disk" "web_instance_disk" {
  instance_id   = google_compute_instance.web_instance.id
  disk          = google_compute_disk.data_disk.name
  mode          = var.disk_mode          
}
resource "google_compute_instance_attachment" "nic_attachment" {
  count = var.nic_count
  instance_name      = google_compute_instance.web_instance[count.index].name
  network_interface = google_compute_network_interface.sample_nic[count.index].name
}
