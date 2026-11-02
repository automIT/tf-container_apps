variable "resource_group_name" {
  type    = string
  default = null
}

variable "cpu" {
  type    = number
  default = 0.5
}

variable "memory" {
  type    = string
  default = "1Gi"
}