resource "google_compute_global_address" "default" {
  name = "global-appserver-ip"
}
resource "google_compute_url_map" "urlmap" {
  name        = "urlmap"
  description = "a description"

  default_service = google_compute_backend_bucket.static.id

  host_rule {
    hosts        = ["mysite.com"]
    path_matcher = "mysite"
  }
}
resource "google_compute_target_http_proxy" "http-proxy" {
  name    = "http-proxy"
  url_map = google_compute_url_map.urlmap.id
}
resource "google_compute_global_forwarding_rule" "http-forwarding-rule" {
    name       = "http-forwarding-rule"
    target     = google_compute_target_http_proxy.http-proxy.id
    port_range = "80"
    ip_protocol = "TCP"
}
resource "google_compute_backend_bucket" "static" {
    name        = "static-backend-bucket"
    bucket_name = google_storage_bucket.static-bucket.name
    enable_cdn  = true
}   