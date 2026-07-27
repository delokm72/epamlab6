locals {
  rg_name                       = format("%s-rg", var.name_prefix)
  sql_server_name               = format("%s-sql", var.name_prefix)
  sql_db_name                   = format("%s-sql-db", var.name_prefix)
  asp_name                      = format("%s-asp", var.name_prefix)
  app_name                      = format("%s-app", var.name_prefix)
  existing_kv_rg_name           = join("-", [var.name_prefix, "kv-rg"])
  existing_kv_name              = join("-", [var.name_prefix, "kv"])
  sql_admin_username            = "sqladmin"
  sql_server_firewall_rule_name = "allow-verification-ip"
}