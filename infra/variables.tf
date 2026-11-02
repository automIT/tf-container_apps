variable "subscription_id" {
  description = "The Subscription ID to deploy resources into"
  type        = string
  default     = "f4d51eb3-2c3b-4728-a0f4-2d06e1169485"
}

variable "resource_group_name" {
  description = "Existing shared Resource Group for the training infrastructure"
  type        = string
  default     = "already-existing-rg"
}

variable "registry_name" {
  description = "Name of the Azure Container Registry (globally unique, 5-50 alphanumeric characters)"
  type        = string
  default     = "automittraincapp"
  validation {
    condition     = can(regex("^[a-zA-Z0-9]{5,50}$", var.registry_name))
    error_message = "The registry_name must be 5-50 alphanumeric characters."
  }
}

variable "registry_sku" {
  description = "SKU of the Azure Container Registry"
  type        = string
  default     = "Basic"
}

variable "images" {
  description = "Images imported into the registry: target repository:tag => source image"
  type        = map(string)
  default = {
    "azuredocs/aci-helloworld:latest" = "mcr.microsoft.com/azuredocs/aci-helloworld:latest"
    "k8se/quickstart-jobs:latest"     = "mcr.microsoft.com/k8se/quickstart-jobs:latest"
  }
}

variable "participant_prefix" {
  description = "Login prefix of the participants (resource group = <prefix><number>)"
  type        = string
  default     = "autworkshopcapp"
}

variable "participant_count" {
  description = "Number of participants; one user assigned identity with AcrPull is created per participant"
  type        = number
  default     = 20
}
