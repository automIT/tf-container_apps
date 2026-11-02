# Übung 2: Container App Job erstellen (Portal)

## Aufgabenstellung

Erstelle im Azure Portal einen Container App Job mit manuellem Trigger.

### Anforderungen

1. Erstelle einen Container App Job `<login>-portal-job` in deiner Resource Group `<login>`
2. Nutze das in Übung 1 erstellte Environment `<login>-portal-env`
3. Nutze das Image `k8se/quickstart-jobs:latest` aus der Microsoft Container Registry (Registry login server `mcr.microsoft.com`)
4. Konfiguriere den Job mit manuellem Trigger
5. Starte den Job (Run now) und prüfe die Ausgaben (Execution History / Logs)

### Namensschema

| Ressource         | Name                 | Beispiel                      |
|-------------------|----------------------|-------------------------------|
| Container App Job | `<login>-portal-job` | `autworkshopcapp1-portal-job` |

### Hinweise

- `quickstart-jobs` wartet ein paar Sekunden, schreibt eine Meldung in die Konsole und beendet sich.
- Ein Job muss sich selbst beenden. Ein Webserver-Image (z. B. `aci-helloworld`) läuft bis zum Replica Timeout und endet als *Failed*.

### Ziel

Unter *Execution history* steht eine Ausführung mit Status *Succeeded*.

### Relevante Dokumentation

- https://learn.microsoft.com/en-us/azure/container-apps/jobs-get-started-portal
