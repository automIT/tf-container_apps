# Übung 5: Container App Environment mit Log Analytics Workspace erweitern

## Aufgabenstellung

Erweitere das in Übung 3 erstellte Container App Environment um einen Log Analytics Workspace.

**Arbeite in deinem Ordner aus Übung 3 weiter** und lege keinen neuen Terraform-Ordner an. Nur so änderst du dasselbe Environment im selben State. Ein neuer Ordner mit eigenem State würde versuchen, das Environment ein zweites Mal anzulegen, und mit *already exists* fehlschlagen.

Dein Login wird zentral aus [`participant.yaml`](../../../participant.yaml) gelesen – Resource Group und Environment-Name (`<login>-env`) werden daraus abgeleitet.

### Anforderungen

1. Verwende die folgenden existierenden Ressourcen:
   - Log Analytics Workspace: `existing-log-analytics-workspace`
   - Resource Group: `already-existing-rg`

2. Konfiguriere das Container App Environment so, dass es den Log Analytics Workspace verwendet

3. Stelle sicher, dass alle notwendigen Data Sources korrekt konfiguriert sind

4. Führe `terraform apply -var-file=envs/dev.tfvars` im Ordner von Übung 3 aus. Erwartet ist `1 to change` (in-place), nicht ein neues Environment.

### Hinweise

- Verwende `data` Blöcke um auf den bestehenden Log Analytics workspace zu verweisen
- Den Tag `customer` setzt unsere Automatisierung auf Ebene der Resource Group. Damit er nicht bei jedem `terraform plan` als Änderung erscheint, ignoriert ihn die Lösung per `lifecycle { ignore_changes = [tags["customer"]] }`.

### Ziel

Logging im Azure Portal funktioniert über die Container App und den Container App Job