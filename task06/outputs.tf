output "sql_server_fqdn" {
  description = "Azure Sql Server FQDN"
  value       = module.sql.sql_server_fqdn
}

output "app_hostname" {
  description = "Azure App hostname"
  value       = module.webapp.app_hostname
}