resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.resource_group.location
  tags     = var.tags
}

module "webapp" {
  source                = "./modules/webapp"
  app_name              = local.app_name
  asp_name              = local.asp_name
  ip_restrictions       = var.app_service["app01"].ip_restrictions
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  tags                  = var.tags
  workers               = var.app_service_plan["asp01"].workers
  sku                   = var.app_service_plan["asp01"].sku
  sql_connection_string = module.sql.sql_connection_string
}

module "sql" {
  source                   = "./modules/sql"
  key_vault_id             = data.azurerm_key_vault.key_vault_existing.id
  allowed_ip_address       = var.allowed_ip_address
  location                 = var.resource_group.location
  resource_group_name      = azurerm_resource_group.rg.name
  sql_admin_username       = local.sql_admin_username
  sql_database_name        = local.sql_db_name
  sql_database_sku         = var.sql_database_sku
  sql_server_name          = local.sql_server_name
  tags                     = var.tags
  sql_server_firewall_name = local.sql_server_firewall_rule_name
}

data "azurerm_key_vault" "key_vault_existing" {
  name                = local.existing_kv_name
  resource_group_name = local.existing_kv_rg_name
}
