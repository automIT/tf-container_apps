# Übung 7: Container App Job mit Modulen

## Aufgabenstellung

Lege einen zeitgesteuerten Container App Job an. Statt die Ressource selbst zu schreiben, verwendest du dafür das Modul aus dem GitHub-Repository [`tf_module_container_job`](https://github.com/automIT/tf_module_container_job).

Ausgangspunkt ist der Code in diesem Ordner. Dein Login wird zentral aus [`participant.yaml`](../../../participant.yaml) gelesen – Resource Group, Environment- und Jobname stehen bereits in `locals-participant.tf`.

### Anforderungen

1. Lies mit einem `data`-Block dein in Übung 3 erstelltes Container App Environment `<login>-env` aus (siehe `local.container_app_env_name`)
2. Nutze das Modul `tf_module_container_job`, um einen Container App Job `<login>-module-job` anzulegen (siehe `local.container_app_job_name`)
3. Verwende als Image `azuredocs/aci-helloworld:latest` aus der Trainings-Registry
4. Übergib einen Schedule (`trigger_type` und `schedule_trigger_config`)
5. Nutze einen weiteren Parameter aus dem Modul, z. B. `env_vars` zum Übergeben von Umgebungsvariablen
6. Rolle den Container App Job mit `terraform apply -var-file=envs/dev.tfvars` aus

### Namensschema

| Ressource                    | Name                    | Beispiel                         |
|------------------------------|-------------------------|----------------------------------|
| Container App Environment    | `<login>-env`           | `autworkshopcapp1-env`           |
| Container App Job            | `<login>-module-job`    | `autworkshopcapp1-module-job`    |
| Managed Identity (vom Modul) | `id-<login>-module-job` | `id-autworkshopcapp1-module-job` |

### Hinweise

- Das Environment wird **nicht** neu angelegt, sondern nur per `data`-Block referenziert.
- Welche Parameter das Modul erwartet, steht in der `README.md` bzw. `variables.tf` des Repositories `tf_module_container_job`.
- `key_vault_id` und `storage_account_name` sind optional und werden in dieser Übung nicht benötigt.
- Module aus einem Git-Repository werden mit Version eingebunden: `source = "git::https://github.com/automIT/tf_module_container_job.git?ref=2.0.0"`
  Mit `?ref=` wählst du einen Tag (z. B. `2.0.0`) oder einen Branch (z. B. `main`). Ein Tag ist fest, `main` liefert immer den neuesten Stand.
- Das Modul zieht Images immer aus der Trainings-Registry `automittraincapp.azurecr.io` (mit deiner Identity `<login>-uami`). Du übergibst nur `<repository>:<tag>`, den Login-Server setzt das Modul selbst davor.
- Nach dem Hinzufügen eines Moduls muss `terraform init` erneut ausgeführt werden.
- `aci-helloworld` ist ein Webserver und beendet sich nicht selbst – setze `replica_timeout_in_seconds` entsprechend kurz (z. B. `120`).
- Wähle einen Cron-Ausdruck, bei dem du die Ausführung während der Schulung beobachten kannst, z. B. `*/5 * * * *`.

### Ziel

Der Job `<login>-module-job` ist im Azure Portal sichtbar und wird nach Zeitplan ausgeführt.
Unter *Execution history* siehst du die Ausführungen, und in der Job-Konfiguration unter *Containers → Environment variables* deine Umgebungsvariablen.
