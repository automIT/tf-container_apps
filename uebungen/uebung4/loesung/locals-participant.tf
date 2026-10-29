# The login is maintained centrally in ../../../participant.yaml.
# An explicitly set resource_group_name variable takes precedence.
locals {
  participant            = yamldecode(file("${path.module}/../../../participant.yaml")).login
  resource_group_name    = coalesce(var.resource_group_name, local.participant)
  container_app_env_name = "${local.participant}-env"
  container_app_name     = "${local.participant}-app"
}
