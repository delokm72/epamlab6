variable "sql_server_name" {
  description = "no need)"
  type        = string
}

variable "sql_database_name" {
  description = "no need)"
  type        = string
}

variable "sql_database_sku" {
  description = "no need)"
  type        = string
}

variable "location" {
  description = "no need)"
  type        = string
}

variable "resource_group_name" {
  description = "no need)"
  type        = string
}
#
variable "key_vault_id" {
  description = "no need)"
  type        = string
}

variable "allowed_ip_address" {
  description = "no need)"
  type        = string
}

variable "sql_admin_username" {
  description = "no need)"
  type        = string
}

variable "sql_server_firewall_name" {
  description = "no need)"
  type        = string
}

variable "tags" {
  description = "Tags applied to the Resource Group."
  type        = map(string)
}