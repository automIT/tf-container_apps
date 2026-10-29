# Übung 2: Container App Job erstellen (Portal)

## Aufgabenstellung

Erstelle im Azure Portal einen Container App Job mit manuellem Trigger.

### Anforderungen

1. Erstelle einen Container App Job in deiner Resource Group `<login>`
2. Nutze das in Übung 1 erstellte Environment `<login>-env`
3. Nutze das Image `mcr.microsoft.com/azuredocs/aci-helloworld:latest`
4. Konfiguriere den Job mit manuellem Trigger
5. Starte den Job und prüfe die Ausgaben (Execution History / Logs)

### Namensschema

| Ressource         | Name                 | Beispiel                      |
|-------------------|----------------------|-------------------------------|
| Container App Job | `<login>-manual-job` | `autworkshopcapp1-manual-job` |

### Relevante Dokumentation

- https://learn.microsoft.com/en-us/azure/container-apps/jobs-get-started-portal
