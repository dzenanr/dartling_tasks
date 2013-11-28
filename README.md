# dartling_tasks

**Categories**: dartling, class models, many-to-many relationship, local storage.

**Concepts**: Project, Employee, Task.

## Description:
dartling_tasks project uses
[dartling] (https://github.com/dzenanr/dartling) for the model.
This application shows how easy is to save and load a model to/from a local storage.

The model is initialized with few entities in lib.dartling.tasks.init.dart.

In web.dartling.tasks.dartling_tasks_web.dart:

    String loadDartlingData(String name) {
      return window.localStorage[name];
    }

    void saveDartlingData(String name, String json) {
      window.localStorage[name] = json;
    }

    showDartlingData(DartlingRepo dartlingRepo) {
      var mainView = new View(document, "main");
      mainView.repo = dartlingRepo;
      new RepoMainSection(mainView);
    }

    void main() {
      var name = 'dartling_tasks_data';
      var dartlingRepo = new DartlingRepo();
      DartlingModels dartlingModels =
          dartlingRepo.getDomainModels(DartlingRepo.dartlingDomainCode);
      TasksEntries dartlingTasksEntries =
          dartlingModels.getModelEntries(DartlingRepo.dartlingTasksModelCode);
      String json = loadDartlingData(name);
      if (json == null) {
        initDartlingTasks(dartlingTasksEntries);
        json = dartlingTasksEntries.toJson();
        saveDartlingData(name, json);
      } else {
        dartlingTasksEntries.fromJson(json);
      }
      showDartlingData(dartlingRepo);
    }

Run the default web app (web.dartling.tasks.dartling_tasks_web.html) to see live data.
The first time you use it, the model is initialized and saved locally.
The next time the model is loaded from the local storage.



