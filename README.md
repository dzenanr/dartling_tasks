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

A concept with more than one parent must have only one internal relationship.
Other relationships of the concept are external
(flagged as such in [Model Concepts](https://github.com/dzenanr/model_concepts)).
External relationships are pertinent only for data persistency.
Once data are loaded into main memory, all relationships are just relationships
that can be used in both directions. An external relationship in a json document
is represented with the oid of the parent entity (similar to a relational foreign key),
which is called reference oid. This reference oid is used in the loading process
to recreate an external relationship into a regular relationship.

To understand this better, you can always use dartling as a relational model.
In that case, all concepts are entry and all relationships are external.
In a relational model a foreign key is used to express an external relationship
and a join based on the primary key of the parent table and the foreign key of
the child table is used to "navigate" between tables. In an object model,
all relationships are internal and bidirectional by default. That means that
there is a child collection object in the parent concept (class) and a parent
object in the child concept (class). In general, an object model is a network
model that may be decomposed into multiple hierarchies each starting with a
different entry concept. Within a hierarchy a relationship is embedded.
However, a relationship between 2 different hierarchies cannot be embedded
without a redundancy of data. That is the reason that a reference oid is used
in a hierarchy where the child concept is. In a hierarchy with a parent concept
of the external relationship there is nothing indicating the relationship,
as in the relational model. The reference oid is used in the loading process
to combine different hierarchies into an object (network) model with external
relationships becoming internal.

