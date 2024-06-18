# create a secret in secret manager to store database credentials
resource "google_secret_manager_secret" "this" {
  secret_id = "${var.instance_name}/${var.database_name}"

  replication {
    auto {}
  }
}

# store the password in the secret
resource "google_secret_manager_secret_version" "this" {
  secret      = google_secret_manager_secret.this.id
  secret_data = jsonencode(local.database_access)
}
