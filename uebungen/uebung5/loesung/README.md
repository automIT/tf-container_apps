# Lösung Übung 5

Übung 5 hat **keinen eigenen Terraform-Ordner**. Die Änderung gehört in den Code aus Übung 3,
damit dasselbe Container App Environment (im selben State) erweitert wird.

## Vorgehen

1. Kopiere `data-log_analytics.tf` in deinen Ordner aus Übung 3.
2. Ersetze dort `resource-app_environment.tf` durch die Datei aus diesem Ordner.
   Die einzige Änderung ist die Zeile `log_analytics_workspace_id = data.azurerm_log_analytics_workspace.existing.id`.
3. Führe im Ordner von Übung 3 `terraform apply -var-file=envs/dev.tfvars` aus.

Erwartet ist `1 to change`: Das Environment wird in-place angepasst, nicht neu angelegt.
Apps und Jobs aus den anderen Übungen bleiben dadurch erhalten.

> Führe in diesem Ordner **kein** `terraform apply` aus. Ein eigener State würde versuchen,
> das Environment aus Übung 3 ein zweites Mal anzulegen (Fehler *already exists*).
