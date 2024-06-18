variable "instance_name" {
  description = "the name of the database instance to create"
  type        = string
}

variable "region" {
  description = "the GCP region to deploy the database to"
  type        = string
  default     = "europe-west9"
}

variable "database_tier" {
  description = "the database tier to use"
  type        = string
  default     = "db-f1-micro"
}

variable "database_name" {
  description = "the name of the database to create in the instance"
  type        = string
}

variable "database_user_name" {
  description = "the name of the database user to create"
  type        = string
}