# Übung 1: Erste Container App erstellen (Portal)

## Aufgabenstellung

Erstelle im Azure Portal eine Container App in deiner Resource Group.

### Anforderungen

1. Erstelle eine Container App in deiner Resource Group `<login>` (z. B. `autworkshopcapp1`)
2. Erstelle dabei ein neues Container App Environment
3. Nutze das Image `nginx:latest` von Docker Hub
4. Aktiviere Ingress (extern, Port 80)
5. Überprüfe den Aufruf der App über die Application URL

### Namensschema

Deinen Login findest du in [`participant.yaml`](../../../participant.yaml) bzw. in deinen Zugangsdaten.

| Ressource                 | Name            | Beispiel               |
|---------------------------|-----------------|------------------------|
| Resource Group            | `<login>`       | `autworkshopcapp1`     |
| Container App Environment | `<login>-env`   | `autworkshopcapp1-env` |
| Container App             | `<login>-app`   | `autworkshopcapp1-app` |

### Relevante Dokumentation

- https://learn.microsoft.com/en-us/azure/container-apps/quickstart-portal
