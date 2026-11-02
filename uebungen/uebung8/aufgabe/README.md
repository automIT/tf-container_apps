# Übung 8: Container App mit Modulen

## Aufgabenstellung

Lege eine Container App an. Verwende dafür das Modul aus dem GitHub-Repository [`tf_module_container_app`](https://github.com/automIT/tf_module_container_app).

Ausgangspunkt ist der Code in diesem Ordner: Resource Group und dein Container App Environment `<login>-env` aus Übung 3 werden bereits per `data`-Block gelesen.
Dein Login wird zentral aus [`participant.yaml`](../../../participant.yaml) gelesen.

### Anforderungen

1. Nutze das Modul `tf_module_container_app`, um eine Container App `<login>-module-app` anzulegen (siehe `local.container_app_name`)
2. Verwende als Image `azuredocs/aci-helloworld:latest` aus der Trainings-Registry
3. Gib die URL der App über einen eigenen `output` aus
4. Rolle die Container App mit `terraform apply -var-file=envs/dev.tfvars` aus

### Namensschema

| Ressource                 | Name                 | Beispiel                      |
|---------------------------|----------------------|-------------------------------|
| Container App Environment | `<login>-env`        | `autworkshopcapp1-env`        |
| Container App             | `<login>-module-app` | `autworkshopcapp1-module-app` |

### Hinweise

- Als Vorlage dienen die `README.md` des Repositories `tf_module_container_app` sowie deine Modulverwendung aus Übung 7.
- Modul-Source: `git::https://github.com/automIT/tf_module_container_app.git?ref=2.0.0` (oder `?ref=main` für den neuesten Stand)
- Nach dem Hinzufügen des Moduls muss `terraform init` erneut ausgeführt werden.
- Das Modul liefert die URL der App als Output `url`.
- Das Modul zieht Images immer aus der Trainings-Registry `automittraincapp.azurecr.io` (mit deiner Identity `<login>-uami`). Du übergibst nur `<repository>:<tag>`.

### Ziel

Die Seite „Welcome to Azure Container Instances!“ ist unter der URL deiner Container App im Browser erreichbar.

## Optionale Aufgabe: eigene Startseite

Ersetze die Standardseite des Images durch eine eigene HTML-Seite, die du per Terraform-Variable übergibst.

1. Lege eine Variable `welcome_html` (Typ `string`) an
2. Setze ihren Wert in `envs/dev.tfvars` auf eine eigene HTML-Seite (Tipp: Heredoc-Syntax `<<-HTML ... HTML`)
3. Übergib die Seite über den Modul-Parameter `mounted_files` an die Container App
4. Rolle die Änderung erneut mit `terraform apply -var-file=envs/dev.tfvars` aus

### Hinweise

- Das Image `aci-helloworld` liefert die Datei `/usr/src/app/index.html` aus. Diesen Pfad musst du in `mounted_files` als `path` angeben.
- Das Modul legt jede Datei als Secret an und mountet sie in den Container. Bei geändertem Inhalt erzeugt es automatisch eine neue Revision.
- Ändere danach den Inhalt von `welcome_html` und beobachte im Portal, wie eine neue Revision entsteht.

### Ziel

Unter der URL deiner Container App wird deine eigene Seite angezeigt.
