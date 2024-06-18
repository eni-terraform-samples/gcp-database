resource "vault_kv_secret_v2" "this" {
  mount     = "secret"
  name      = "${var.instance_name}/${var.database_name}"
  data_json = jsonencode(local.database_access)
}
