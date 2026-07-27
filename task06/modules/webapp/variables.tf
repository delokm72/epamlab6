variable "asp_name" {
  description = "App service plan name."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
}

variable "resource_group_name" {
  description = "Name of assigned resource group"
  type        = string
}

variable "sku" {
  type        = string
  description = "sku"
}

variable "workers" {
  type        = number
  description = "Qty of workers"
}

variable "tags" {
  description = "Tags applied to the Resource Group."
  type        = map(string)
}

variable "app_name" {
  description = "App service name."
  type        = string
}

variable "ip_restrictions" {
  type = list(object({
    name        = string
    priority    = number
    action      = string
    service_tag = optional(string)
    ip_address  = optional(string)
  }))
}

variable "sql_connection_string" {
  description = "..."
  type        = string
}