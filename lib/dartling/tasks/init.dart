                                                                                                    part of dartling_tasks;

// lib/dartling/tasks/init.dart

initDartlingTasks(TasksEntries entries) {
  _initEmployees(entries);
  _initProjects(entries);
  _initTasks(entries);
  entries.toJson();
  entries.displayJson();
}

_initEmployees(TasksEntries entries) {
  Employee employee = new Employee(entries.employees.concept);
  employee.email = "dzenanr@gmail.com";
  employee.lastName = "Ridjanovic";
  employee.firstName = "Dzenan";
  entries.employees.add(employee);

  employee = new Employee(entries.employees.concept);
  employee.email = "mfgiguere@gmail.com";
  employee.lastName = "Fournier-Giguère";
  employee.firstName = "Maxim";
  entries.employees.add(employee);

  employee = new Employee(entries.employees.concept);
  employee.email = "ivo.balbaert@telenet.be";
  employee.lastName = "Balbaert";
  employee.firstName = "Ivo";
  entries.employees.add(employee);

  employee = new Employee(entries.employees.concept);
  employee.email = "timur.ridjanovic@gmail.com";
  employee.lastName = "Ridjanovic";
  employee.firstName = "Timur";
  entries.employees.add(employee);
}

_initProjects(TasksEntries entries) {
  Project project = new Project(entries.projects.concept);
  project.name = "On Dart Education";
  project.description = "An education site to help beginners in the Dart programming language.";
  entries.projects.add(project);

  project = new Project(entries.projects.concept);
  project.name = "Learning Dart";
  project.description = "A book that uses many Dart projects to explain the programming language";
  entries.projects.add(project);

  project = new Project(entries.projects.concept);
  project.name = "On Dart Blog";
  project.description = "Introduction to some Dart projects from dzenanr.";
  entries.projects.add(project);

  project = new Project(entries.projects.concept);
  project.name = "On Dart Google+";
  project.description = "To follow news about Dart projects.";
  entries.projects.add(project);
}

_initTasks(TasksEntries entries) {
  Employees employees = entries.employees;
  Projects projects = entries.projects;

  Project project = projects.singleWhereAttributeId('name', 'On Dart Education');
  assert(project != null);

  Employee employee = employees.singleWhereAttributeId('email', 'dzenanr@gmail.com');
  assert(employee != null);

  Task task = new Task.withId(project.tasks.concept, project, employee);
  task.description = 'To maintain the content up to date with Dart.';
  project.tasks.add(task);
  employee.tasks.add(task);

  employee = employees.singleWhereAttributeId('email', 'timur.ridjanovic@gmail.com');
  assert(employee != null);

  task = new Task.withId(project.tasks.concept, project, employee);
  task.description = 'To use and validate the content.';
  project.tasks.add(task);
  employee.tasks.add(task);

  project = projects.singleWhereAttributeId('name', 'Learning Dart');
  assert(project != null);

  task = new Task.withId(project.tasks.concept, project, employee);
  task.description = 'To read and validate the content.';
  project.tasks.add(task);
  employee.tasks.add(task);

  employee = employees.singleWhereAttributeId('email', 'ivo.balbaert@telenet.be');
  assert(employee != null);

  task = new Task.withId(project.tasks.concept, project, employee);
  task.description = 'To write the content.';
  project.tasks.add(task);
  employee.tasks.add(task);

  employee = employees.singleWhereAttributeId('email', 'dzenanr@gmail.com');
  assert(employee != null);

  task = new Task.withId(project.tasks.concept, project, employee);
  task.description = 'To code the projects.';
  project.tasks.add(task);
  employee.tasks.add(task);
}

