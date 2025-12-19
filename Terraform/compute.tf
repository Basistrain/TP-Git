data "google_compute_default_service_account" "default" {
  project = "${var.project}"
}
data "google_compute_region_instance_group_manager" "rigm" {
  name = "my-igm"
  region = "europe-west9"
}
resource "google_compute_instance_group_manager" "igm" {
  name               = "my-igm"
  base_instance_name = "my-instance"
  region             = "europe-west9"
  version {
    instance_template = google_compute_instance_template.instance-template.self_link
  }
  target_size        = 2
  named_port {
    name = "http"
    port = 80
  }
}
resource "google_compute_autoscaler" "autoscaler" {
  name   = "my-autoscaler"
  region = "europe-west9"
  target = google_compute_instance_group_manager.igm.id
  autoscaling_policy {
    max_replicas    = 5
    min_replicas    = 1
    cooldown_period = 60
    cpu_utilization {
      target_utilization = 0.6
    }
  }
}       
resource "google_compute_health_check" "tcp-health-check" {
  name = "tcp-health-check"

  timeout_sec        = 1
  check_interval_sec = 1

  tcp_health_check {
    port = "80"
  }
}
