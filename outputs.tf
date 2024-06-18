output "database_dns_name" {
  description = "the DNS name of the instance"
  value       = google_sql_database_instance.this.dns_name
}
