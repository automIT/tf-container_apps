module "containerjob_scheduled" {
  source = "git::https://github.com/automIT/tf_module_container_job.git?ref=2.0.0"

  cj_name                      = local.container_app_job_name
  resource_group_name          = data.azurerm_resource_group.rg.name
  container_app_environment_id = data.azurerm_container_app_environment.environment.id
  container_image              = "k8se/quickstart-jobs:latest"
  replica_timeout_in_seconds   = 120 # aci-helloworld ist ein Webserver und beendet sich nicht selbst

  trigger_type = "Schedule"
  schedule_trigger_config = {
    cron_expression          = "*/5 * * * *" # alle 5 Minuten
    parallelism              = 1
    replica_completion_count = 1
  }

  env_vars = [
    {
      name  = "test"
      value = "1234"
    }
  ]
}
