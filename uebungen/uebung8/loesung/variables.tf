variable "resource_group_name" {
  type    = string
  default = null
}

variable "welcome_html" {
  description = "HTML der Startseite, wird als /usr/src/app/index.html in den Container gemountet"
  type        = string
}
