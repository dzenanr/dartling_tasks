part of dartling_tasks; 
 
// lib/gen/dartling/models.dart 
 
class DartlingModels extends DomainModels { 
 
  DartlingModels(Domain domain) : super(domain) { 
    add(fromJsonToTasksEntries()); 
  } 
 
  TasksEntries fromJsonToTasksEntries() { 
    return new TasksEntries(fromJsonToModel( 
      dartlingTasksModelJson, 
      domain, 
      DartlingRepo.dartlingTasksModelCode)); 
  } 
 
} 
 
