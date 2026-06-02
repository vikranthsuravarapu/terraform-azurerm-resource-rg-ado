output "resource_group_name" {
  description = "Name of the Azure Resource Group."
  value       = azurerm_resource_group.RGADO.name
}

output "resource_group_id" {
  description = "ID of the Azure Resource Group."
  value       = azurerm_resource_group.RGADO.id
}

output "resource_group_location" {
  description = "Location of the Azure Resource Group."
  value       = azurerm_resource_group.RGADO.location
}
