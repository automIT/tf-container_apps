# Übung 6: Image aus einer privaten Container Registry

## Aufgabenstellung

Bisher zieht deine Container App das öffentliche Image `mcr.microsoft.com/azuredocs/aci-helloworld:latest`.
Stelle die Container App so um, dass sie das Image aus der privaten Azure Container Registry des Trainings zieht.

Ausgangspunkt ist der Code in diesem Ordner (Stand: Lösung Übung 3). Dein Login wird zentral aus
[`participant.yaml`](../../../participant.yaml) gelesen.

### Anforderungen

1. Lies mit `data`-Blöcken die folgenden existierenden Ressourcen aus:
   - Container Registry `automittraincapp` in der Resource Group `already-existing-rg`
   - User Assigned Identity `<login>-uami` in deiner Resource Group (siehe `local.identity_name`)
2. Weise der Container App die Identity zu (`identity`-Block)
3. Konfiguriere die Registry so, dass sie mit dieser Identity angemeldet wird (`registry`-Block)
4. Nutze als Image `<login_server der Registry>/azuredocs/aci-helloworld:latest`
5. Führe `terraform apply -var-file=envs/dev.tfvars` aus und prüfe die App im Browser

### Hinweise

- Die Identity hat bereits die Rolle `AcrPull` auf der Registry – du musst keine Rollen zuweisen.
- Der Login-Server der Registry steht im Attribut `login_server` der Data Source.
- Ohne `registry`-Block schlägt das Deployment fehl, weil die Registry keinen anonymen Zugriff erlaubt.
- Den Tag `customer` setzt unsere Automatisierung auf Ebene der Resource Group. Damit er nicht bei jedem `terraform plan` als Änderung erscheint, ignoriert ihn die Lösung per `lifecycle { ignore_changes = [tags["customer"]] }`.

### Zusatz

Stelle auch die beiden Container App Jobs aus Übung 4 auf das Image
`<login_server>/k8se/quickstart-jobs:latest` aus der Registry um.

### Ziel

Die Container App läuft mit dem `aci-helloworld`-Image aus der privaten Registry.
Im Portal siehst du unter *Container App → Container* das Image mit dem Registry-Login-Server.

### Relevante Dokumentation

- https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/container_registry
- https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/user_assigned_identity
- https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_app#registry
- https://learn.microsoft.com/en-us/azure/container-apps/managed-identity-image-pull
