resource "google_sql_database_instance" "main" {
  name             = "main-instance"
  database_version = "POSTGRES_15"
  region           = "europe-west9"

  settings {
    # Second-generation instance tiers are based on the machine
    # type. See argument reference below.
    tier = "db-f1-micro"
  }
}
resource "google_sql_database" "main_db" {
  name     = "main_database"
  instance = google_sql_database_instance.main.name
  charset  = "UTF8"
  collation = "en_US.UTF8"
}
resource "google_sql_user" "users" {
  name     = "db_user"
  instance = google_sql_database_instance.main.name
  password = "securepassword123"
}