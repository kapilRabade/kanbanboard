import 'package:get/get.dart';

class Languages extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        "en_US": {
          "loading": "Loading...",
          "projects": "PROJECTS",
          "no_projects_found_create_new":
              "No Projects found !! Please create new project",
          "create_project": "Create Project",
          "project_name": "Project Name",
          "create": "Create",
          "update_project": "Update Project",
          "project_name": "Project Name",
          "update": "Update",
          "create_task": "Create Task",
          "task_content": "Task content",
          "cancel": "Cancel",
          "edit_task": "Edit Task",
          "save" : "Save",
          "to_do" : "To Do",
          "in_progress" : "In Progress",
          "done" : "Done"
        },
        "de_DE": {
          "loading": "Wird geladen...",
          "projects": "PROJEKTE",
          "no_projects_found_create_new": "Keine Projekte gefunden! Bitte neues Projekt erstellen",
          "create_project": "Projekt erstellen",
          "project_name": "Projektname",
          "create": "Erstellen",
          "update_project": "Projekt aktualisieren",
          "update": "Aktualisieren",
          "create_task": "Aufgabe erstellen",
          "task_content": "Aufgabeninhalt",
          "cancel": "Abbrechen",
          "edit_task": "Aufgabe bearbeiten",
          "save": "Speichern","to_do": "Zu erledigen",
          "in_progress": "In Bearbeitung",
          "done": "Erledigt"
        }
      };
}
