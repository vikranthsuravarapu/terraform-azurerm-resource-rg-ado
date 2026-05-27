# Terraform-Azurerm-RG-ADO

Terraform module to create an Azure Resource Group for use with Azure DevOps pipelines and related deployments.

## Overview

This module provisions a single Azure Resource Group using the `azurerm` provider. It is intended for use in Azure DevOps pipelines and can be referenced by other Terraform configurations.

## Requirements

- Terraform 1.5+ (or compatible version)
- AzureRM provider 3.0+ (or compatible version)

## Providers

- `azurerm`

## Module Usage

```hcl
module "rg_ado" {
    source              = "./path/to/module"
    resource_group_name = "rg-ado-example"
    location            = "eastus"
    tags = {
        environment = "dev"
        project     = "ado-integration"
    }
}
```

## Inputs

- `resource_group_name`
    - Description: Name of the Azure Resource Group.
    - Type: `string`
    - Required: yes

- `location`
    - Description: Azure location where the resource group will be created.
    - Type: `string`
    - Required: yes

- `tags`
    - Description: Tags to assign to the resource group.
    - Type: `map(string)`
    - Default: `{}`

- `managed_by`
    - Description: ID of the resource that manages this resource group, if applicable.
    - Type: `string`
    - Default: `null`

## Outputs

- `resource_group_id`
    - Description: The Azure Resource Group ID.

- `resource_group_name`
    - Description: The name of the Azure Resource Group.

- `location`
    - Description: The Azure location of the Resource Group.

- `tags`
    - Description: The tags assigned to the Resource Group.

## Example

```hcl
terraform {
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "~> 3.0"
        }
    }
}

provider "azurerm" {
    features {}
}

module "rg_ado" {
    source              = "./terraform-azurerm-rg-ado"
    resource_group_name = "ado-rg-demo"
    location            = "eastus2"
    tags = {
        environment = "production"
        team        = "devops"
    }
}
```

## Notes

- Ensure Azure credentials are configured for Terraform before using this module.
- Adjust provider versions and module source path as needed for your repository structure.
- Extend the module if you need Azure DevOps service connections or additional Azure resources.