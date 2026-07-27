variable "name_prefix" {
  description = "to generate in locals"
  type    = string
  default = "cmaz-53z813ye-mod6"
}

variable "resource_group" {
  description = "Resource Group configuration."
  type = object({
    name     = string
    location = string
  })
}

variable "app_service_plan" {
  description = "Configuration for Azure Service plans"
  type = map(object({
    name               = string
    resource_group_key = string
    sku                = string
    workers            = number
    tags               = map(string)
  }))
}

variable "app_service" {
  description = "Configuration for Azure Services"
  type = map(object({
    name                 = string
    resource_group_key   = string
    app_service_plan_key = string
    tags                 = map(string)
    ip_restrictions = list(object({
      name        = string
      priority    = number
      action      = string
      service_tag = optional(string)
      ip_address  = optional(string)
    }))
  }))
}

variable "tags" {
  description = "Tags applied to all Azure resources"
  type        = map(string)
}

variable "allowed_ip_address" {
  description = "..."
  type = string
}

variable "sql_database_sku" {
  description = "..."
  type = string
}

variable "sql_database_name" {
  description = "..."
  type = string
}