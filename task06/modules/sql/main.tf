resource "random_password" "sql_password" {
  length           = 12
  min_upper        = 2
  min_lower        = 2
  min_numeric      = 2
  min_special      = 2
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "azurerm_key_vault_secret" "sql_admin_username" {
  name         = "sql-admin-name"
  value        = var.sql_admin_username
  key_vault_id = var.key_vault_id
}

resource "azurerm_key_vault_secret" "sql_admin_password" {
  name         = "sql-admin-password"
  value        = random_password.sql_password.result
  key_vault_id = var.key_vault_id
}

resource "azurerm_mssql_server" "sql" {
  administrator_login          = var.sql_admin_username
  administrator_login_password = random_password.sql_password.result
  location                     = var.location
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  version                      = "12.0"
  tags                         = var.tags
}

resource "azurerm_mssql_database" "sql_database" {
  name      = var.sql_database_name
  server_id = azurerm_mssql_server.sql.id
  sku_name  = var.sql_database_sku
  tags      = var.tags
}

resource "azurerm_mssql_firewall_rule" "verification" {
  name             = "allow-verification-ip"
  start_ip_address = var.allowed_ip_address
  end_ip_address   = var.allowed_ip_address
  server_id        = azurerm_mssql_server.sql.id
}

resource "azurerm_mssql_firewall_rule" "internal" {
  name             = "allow-internal-ip"
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
  server_id        = azurerm_mssql_server.sql.id
}
