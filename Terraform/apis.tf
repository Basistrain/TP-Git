resource "google_project_service" "services" {
  for_each = toset(var.services)
  project = "TP-Terraform-Micsi"
  service = each.value
}
resource "google_project_iam_member" "service-accounts" {
  for_each = toset(var.service_accounts)
  project = "TP-Terraform-Micsi"
  role    = each.value.role
  member  = "serviceAccount:${each.value.email}"
}
resource "google_project_iam_member" "project-roles" {
  for_each = toset(var.project_roles)
  project = "TP-Terraform-Micsi"
  role    = each.value.role
  member  = each.value.member
}
