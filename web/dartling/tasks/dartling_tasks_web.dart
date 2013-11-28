
// web/dartling/tasks/dartling_tasks_web.dart

import "dart:html";

import "package:dartling/dartling.dart";
import "package:dartling_default_app/dartling_default_app.dart";

import "package:dartling_tasks/dartling_tasks.dart";

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
  print(json);
  if (json == null) {
    initDartlingTasks(dartlingTasksEntries);
    json = dartlingTasksEntries.toJson();
    print(json);
    saveDartlingData(name, json);
  } else {
    dartlingTasksEntries.fromJson(json);
  }
  showDartlingData(dartlingRepo);
}

