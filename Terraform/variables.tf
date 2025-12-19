resource "google_runtimeconfig_config" "my-runtime-config" {
  name        = "my-service-runtime-config"
  description = "Runtime configuration values for my service"
}

resource "google_runtimeconfig_variable" "environment" {
  parent = google_runtimeconfig_config.my-runtime-config.name
  name   = "prod-variables/hostname"
  text   = "example.com"
}
