# Terraform Training: Azure Container Apps

Übungen zur Schulung „Terraform - Modul 4 (Container Apps)“. Die Aufgabenstellungen findest du in BeyondSlides, den Code dazu in diesem Repository.

## Erste Schritte

1. Repository klonen
2. Deinen Login in [`participant.yaml`](participant.yaml) eintragen (z. B. `autworkshopcapp1`).
   Das ist die einzige Stelle, an der du deine Teilnehmernummer pflegst. Alle Terraform-Übungen leiten daraus die Namen deiner Ressourcen ab.
3. In der jeweiligen Übung im Ordner `aufgabe` arbeiten:

   ```bash
   cd uebungen/uebung3/aufgabe
   terraform init
   terraform apply -var-file=envs/dev.tfvars
   ```

## Repo-Struktur

```text
.
├── participant.yaml        # dein Login, wird von allen Übungen gelesen
├── uebungen/
│   ├── uebung1/            # Portal: Environment + Container App
│   ├── uebung2/            # Portal: Container App Job
│   ├── uebung3/            # Terraform: Environment + Container App
│   ├── uebung4/            # Terraform: Container App Jobs (manuell + zeitgesteuert)
│   ├── uebung5/            # Terraform: Log Analytics (Änderung im Code von Übung 3)
│   ├── uebung6/            # Terraform: Image aus privater Registry (Managed Identity)
│   ├── uebung7/            # Terraform-Modul: Container App Job
│   └── uebung8/            # Terraform-Modul: Container App
└── infra/                  # Vorbereitung durch den Trainer, nicht anfassen
```

Übung 1 und 2 machst du im Azure Portal. Dort gibt es nur eine `aufgabe/README.md`, aber keinen Terraform-Code.

## Aufbau einer Übung

Jede Terraform-Übung hat zwei Ordner:

| Ordner | Inhalt |
| --- | --- |
| `aufgabe` | Dein Startpunkt. Hier arbeitest du und führst `terraform` aus. |
| `loesung` | Musterlösung zum Nachschauen, falls du nicht weiterkommst. |

In jedem Ordner findest du:

| Datei | Zweck |
| --- | --- |
| `providers.tf` | Provider `azurerm` und Subscription |
| `locals-participant.tf` | liest deinen Login aus `participant.yaml` und bildet daraus die Namen |
| `data-rg.tf` | liest deine Resource Group |
| `variables.tf` | Variablen der Übung |
| `envs/dev.tfvars` | Werte für die Variablen, wird mit `-var-file` übergeben |
| `README.md` | Aufgabenstellung (falls vorhanden) |

Jeder Ordner hat seinen eigenen Terraform-State. **Ausnahme: Übung 5.** Sie hat keinen eigenen Terraform-Ordner, du änderst dort deinen Code aus Übung 3.

## Namensschema

| Ressource | Name | Beispiel |
| --- | --- | --- |
| Resource Group | `<login>` | `autworkshopcapp1` |
| Container App Environment | `<login>-env` | `autworkshopcapp1-env` |
| Container App (Ü3) | `<login>-app` | `autworkshopcapp1-app` |
| Container App Jobs (Ü4) | `<login>-manual-job`, `<login>-scheduled-job` | `autworkshopcapp1-manual-job` |
| Container App (Ü6) | `<login>-acr-app` | `autworkshopcapp1-acr-app` |
| Module (Ü7, Ü8) | `<login>-module-job`, `<login>-module-app` | `autworkshopcapp1-module-app` |
| Managed Identity | `<login>-uami` | `autworkshopcapp1-uami` |
| Portal-Ressourcen (Ü1, Ü2) | `<login>-portal-env`, `<login>-portal-app`, `<login>-portal-job` | `autworkshopcapp1-portal-env` |

## Hinweise

- **Reihenfolge:** Ab Übung 4 wird das Environment `<login>-env` aus Übung 3 nur per `data`-Block gelesen. Übung 3 muss also zuerst ausgerollt sein.
- **Images:** Kein Docker Hub (Rate Limits). Öffentliche Images kommen aus `mcr.microsoft.com`, ab Übung 6 aus der Trainings-Registry `automittraincapp.azurecr.io`.
- **Aufräumen:** Am Ende in jedem `aufgabe`-Ordner `terraform destroy -var-file=envs/dev.tfvars` ausführen. Beginne mit den Übungen, die das Environment nur lesen (Ü8, Ü7, Ü6, Ü4), und destroye Übung 3 zuletzt.
