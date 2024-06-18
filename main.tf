# create a database server instance
resource "google_sql_database_instance" "this" {
  name             = var.instance_name
  database_version = "POSTGRES_15"

  region = var.region

  settings {
    tier            = var.database_tier
    disk_size       = 20
    disk_autoresize = true
    backup_configuration {
      enabled = true
    }
  }
}

# create a database inside the instance
resource "google_sql_database" "this" {
  instance = google_sql_database_instance.this.id
  name     = var.database_name
}
