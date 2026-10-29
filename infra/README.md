# Trainer-Infrastruktur: Container Registry

Legt in der gemeinsamen Resource Group `already-existing-rg` eine Azure Container Registry an
und importiert die in den Übungen verwendeten Images:

| Image in der ACR                    | Quelle                                              |
|-------------------------------------|-----------------------------------------------------|
| `nginx:latest`                      | `docker.io/library/nginx:latest`                    |
| `azuredocs/aci-helloworld:latest`   | `mcr.microsoft.com/azuredocs/aci-helloworld:latest` |

Zusätzlich wird pro Teilnehmer (`autworkshopcapp1` … `autworkshopcapp20`) eine User Assigned Identity
`<login>-uami` in dessen Resource Group angelegt und mit `AcrPull` auf die Registry berechtigt (für Übung 6).
Anzahl und Präfix: Variablen `participant_count` / `participant_prefix`.

> Nur für Trainer – Teilnehmer nutzen diesen Ordner nicht.

## Voraussetzungen

- `az login` mit Owner- bzw. User-Access-Administrator-Rechten (Rollenzuweisungen) auf `already-existing-rg` und den Teilnehmer-Resource-Groups
- Die Teilnehmer-Resource-Groups `autworkshopcapp1` … `autworkshopcapp20` existieren bereits
- Der Image-Import läuft über `az acr import`
- Terraform >= 1.5

## Ausrollen

Am besten einige Minuten vor dem Training ausrollen, damit die Rollenzuweisungen sicher aktiv sind.

```bash
cd infra
terraform init
terraform apply
```

Registry-Name, SKU und Image-Liste lassen sich über die Variablen in `variables.tf` anpassen.
Ein Image neu importieren (z. B. für ein aktuelles `nginx:latest`):

```bash
terraform apply -replace='terraform_data.image_import["nginx:latest"]'
```
