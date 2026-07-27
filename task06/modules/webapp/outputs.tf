output "id" {
  description = "The ID of the App Service Plan."
  value       = azurerm_service_plan.plan.id
}

output "app_hostname" {
  description = "..."
  value       = azurerm_linux_web_app.app.default_hostname
}