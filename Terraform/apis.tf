resource "google_project_service" "services" {
  for_each = toset(var.services)
  project = "TP-Terraform-Micsi"
  service = each.value
}
