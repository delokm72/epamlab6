resource "azurerm_service_plan" "plan" {
  name                = var.asp_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = var.sku
  worker_count        = var.workers
  tags                = var.tags
  os_type             = "Linux"
}

resource "azurerm_linux_web_app" "app" {
  name                = var.app_name
  tags                = var.tags
  service_plan_id     = azurerm_service_plan.plan.id
  location            = var.location
  resource_group_name = var.resource_group_name
  connection_string {
    name  = "DefaultConnection"
    type  = "SQLAzure"
    value = var.sql_connection_string
  }
  site_config {
    application_stack {
      dotnet_version = "8.0"
    }
    ip_restriction_default_action = "Allow"
    dynamic "ip_restriction" {
      for_each = var.ip_restrictions
      content {
        name        = ip_restriction.value.name
        priority    = ip_restriction.value.priority
        action      = ip_restriction.value.action
        service_tag = try(ip_restriction.value.service_tag, null)
        ip_address  = try(ip_restriction.value.ip_address, null)
      }
    }
  }
}