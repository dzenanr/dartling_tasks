 
// test/dartling/tasks/dartling_tasks_test.dart 
 
import "package:test/test.dart"; 
 
import "package:dartling/dartling.dart"; 
 
import "package:dartling_tasks/dartling_tasks.dart"; 
 
testDartlingTasks(Repo repo, String domainCode, String modelCode) { 
  var models; 
  var session; 
  var entries; 
  group("Testing ${domainCode}.${modelCode}", () { 
    setUp(() { 
      models = repo.getDomainModels(domainCode); 
      session = models.newSession(); 
      entries = models.getModelEntries(modelCode); 
      expect(entries, isNotNull); 
 
 
    }); 
    tearDown(() { 
      entries.clear(); 
    }); 
    test("Empty Entries Test", () { 
      expect(entries.isEmpty, isTrue); 
    }); 
 
  }); 
} 
 
testDartlingData(DartlingRepo dartlingRepo) { 
  testDartlingTasks(dartlingRepo, DartlingRepo.dartlingDomainCode, 
      DartlingRepo.dartlingTasksModelCode); 
} 
 
void main() { 
  var dartlingRepo = new DartlingRepo(); 
  testDartlingData(dartlingRepo); 
} 
 
