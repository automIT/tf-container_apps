# Übung 5: Container App Environment mit Log Analytics Workspace erweitern

## Aufgabenstellung

Erweitere das in Übung 3 erstellte Container App Environment um einen Log Analytics Workspace.

### Anforderungen

1. Verwende die folgenden existierenden Ressourcen:
   - Log Analytics Workspace: `existing-log-analytics-workspace`
   - Resource Group: `already-existing-rg`

2. Konfiguriere das Container App Environment so, dass es den Log Analytics Workspace verwendet

3. Stelle sicher, dass alle notwendigen Data Sources korrekt konfiguriert sind

### Hinweise

- Verwende `data` Blöcke um auf den bestehenden Log Analytics workspace zu verweisen

### Ziel

Logging im Azure Portal funktioniert über die Container App und den Container App Job