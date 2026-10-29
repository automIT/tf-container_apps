variable "resource_group_name" {
  type    = string
  default = null
}

variable "cpu" {
  type    = number
}

variable "memory" {
  type    = string
}

variable "registry_name" {
  description = "Name of the shared Azure Container Registry"
  type        = string
  default     = "automittraincapp"
}

variable "registry_resource_group_name" {
  description = "Resource Group of the shared Azure Container Registry"
  type        = string
  default     = "already-existing-rg"
}
