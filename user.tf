locals {
  database_access = {
    database_host = google_sql_database_instance.this.ip_address[0].ip_address
    username      = google_sql_user.user.name
    password      = google_sql_user.user.password
  }
}

resource "random_password" "user_password" {
  length = 12
}

resource "google_sql_user" "user" {
  instance = google_sql_database_instance.this.id
  name     = var.database_user_name
  password = random_password.user_password.result
}
