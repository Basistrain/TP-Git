resource "google_network_management_organization_vpc_flow_logs_config" "org-test" {
  vpc_flow_logs_config_id = "basic-org-test-id"
  location                = "global"
  organization            = "123456789"
}

resource "google_compute_network" "vpc-network" {
  name                    = "vpc-network"
  auto_create_subnetworks = false
}
resource "google_compute_subnetwork" "vpc-subnet" {
  name          = "vpc-subnet"
  ip_cidr_range = "10.0.0.0/24"
  network       = google_compute_network.vpc-network.name
}
resource "google_compute_c "vpc-firewall" {
  name    = "vpc-firewall"
  network = google_compute_network.vpc-network.name
  allow {
    protocol = "ssh"
    ports    = ["22"]
  }
  allow {
    protocol = "http"
    ports    = ["80"]
  }
  source_ranges = ["10.0.0.0/24"]
    direction     = "INGRESS"
    priority      = 1000
}
resource "google_compute_router" "vpc-router" {
  name    = "vpc-router"
  network = google_compute_network.vpc-network.name
  region  = "europe-west9"
}
resource "google_compute_router_nat" "vpc-nat" {
  name                       = "vpc-nat"
  router                     = google_compute_router.vpc-router.name
  region                     = "europe-west9"
  nat_ip_allocate_option     = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}       
resource "google_compute_global_address" "vpc-global-ip" {
  name = "vpc-global-ip"
}
