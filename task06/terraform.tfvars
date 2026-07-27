resource_group = {
  name     = "cmaz-53z813ye-mod6-rg"
  location = "Central US"
}

app_service_plan = {
  asp01 = {
    name               = "cmaz-53z813ye-mod6-asp"
    sku                = "P0v3"
    resource_group_key = "rg01"
    workers            = 1
    tags = {
      Creator = "oleksandr_muravskyi@epam.com"
    }
  }
}

app_service = {
  app01 = {
    name                 = "cmaz-53z813ye-mod6-app"
    resource_group_key   = "rg01"
    app_service_plan_key = "asp01"
    tags = {
      Creator = "oleksandr_muravskyi@epam.com"
    }
    ip_restrictions = [
      {
        name       = "allow-validator-ip"
        priority   = 100
        action     = "Allow"
        ip_address = "18.153.146.156/32"
      },
      {
        name       = "allow-my-ip"
        priority   = 200
        action     = "Allow"
        ip_address = "18.153.146.156/32"
      }
    ]
  }
}

allowed_ip_address = "18.153.146.156"
sql_database_sku   = "S2"
sql_database_name  = "cmaz-53z813ye-mod6-sql-db"

tags = {
  Creator = "oleksandr_muravskyi@epam.com"
}