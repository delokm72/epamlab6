output "result" {
  description = "Result of generation."
  value       = random_password.sql_password.result
}

output "sql_server_fqdn" {
  description = "..."
  value       = azurerm_mssql_server.sql.fully_qualified_domain_name
}

output "sql_connection_string" {
  description = "SQL connection string for ADO.NET"
  sensitive   = true
  value = format(
    "Server=tcp:%s,1433;Initial Catalog=%s;Persist Security Info=False;User ID=%s;Password=%s;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;",
    azurerm_mssql_server.sql.fully_qualified_domain_name,
    azurerm_mssql_database.sql_database.name,
    var.sql_admin_username,
    random_password.sql_password.result
  )
}