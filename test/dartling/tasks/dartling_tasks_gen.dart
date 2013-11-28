 
// test/dartling/tasks/dartling_tasks_gen.dart 
 
import "package:dartling/dartling.dart"; 
 
import "package:dartling_tasks/dartling_tasks.dart"; 
 
genCode() { 
  var repo = new Repo(); 
 
  var dartlingDomain = new Domain("Dartling"); 
 
  Model dartlingTasksModel = 
      fromJsonToModel(dartlingTasksModelJson, dartlingDomain, "Tasks"); 
 
  repo.domains.add(dartlingDomain); 
 
  repo.gen("dartling_tasks"); 
} 
 
initDartlingData(DartlingRepo dartlingRepo) { 
   var dartlingModels = 
       dartlingRepo.getDomainModels(DartlingRepo.dartlingDomainCode); 
 
   var dartlingTasksEntries = 
       dartlingModels.getModelEntries(DartlingRepo.dartlingTasksModelCode); 
   initDartlingTasks(dartlingTasksEntries); 
   dartlingTasksEntries.display(); 
   dartlingTasksEntries.displayJson(); 
} 
 
void main() { 
  genCode(); 
 
  var dartlingRepo = new DartlingRepo(); 
  initDartlingData(dartlingRepo); 
} 
 
