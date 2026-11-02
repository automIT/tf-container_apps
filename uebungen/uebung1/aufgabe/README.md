# Übung 1: Container App Environment und Container App erstellen (Portal)

## Aufgabenstellung

Erstelle im Azure Portal dein erstes Container App Environment und darin eine Container App mit öffentlichem Ingress.

### Anforderungen

1. Erstelle in deiner Resource Group `<login>` (z. B. `autworkshopcapp1`) ein neues Container App Environment `<login>-portal-env`
2. Erstelle darin eine Container App `<login>-portal-app`
3. Nutze das Image `azuredocs/aci-helloworld:latest` aus der Microsoft Container Registry (Registry login server `mcr.microsoft.com`)
4. Aktiviere Ingress (HTTP, Accepting traffic from anywhere, Target Port 80)
5. Überprüfe den Aufruf der App über die Application URL

### Namensschema

Deinen Login findest du in [`participant.yaml`](../../../participant.yaml) bzw. in deinen Zugangsdaten.

| Ressource                 | Name                 | Beispiel                      |
|---------------------------|----------------------|-------------------------------|
| Resource Group            | `<login>`            | `autworkshopcapp1`            |
| Container App Environment | `<login>-portal-env` | `autworkshopcapp1-portal-env` |
| Container App             | `<login>-portal-app` | `autworkshopcapp1-portal-app` |

### Hinweise

- Die Portal-Ressourcen tragen den Zusatz `-portal`, damit sie nicht mit den Terraform-Ressourcen aus Übung 3 (`<login>-env`, `<login>-app`) kollidieren.
- Kein Docker Hub: anonyme Pulls scheitern dort häufig am Rate Limit.

### Ziel

Unter der Application URL erscheint die Seite „Welcome to Azure Container Instances!“.

### Relevante Dokumentation

- https://learn.microsoft.com/en-us/azure/container-apps/quickstart-portal
