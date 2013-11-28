part of dartling_tasks; 
 
// lib/gen/dartling/repository.dart 
 
class DartlingRepo extends Repo { 
 
  static final dartlingDomainCode = "Dartling"; 
  static final dartlingTasksModelCode = "Tasks"; 
 
  DartlingRepo([String code="DartlingRepo"]) : super(code) { 
    _initDartlingDomain(); 
  } 
 
  _initDartlingDomain() { 
    var dartlingDomain = new Domain(dartlingDomainCode); 
    domains.add(dartlingDomain); 
    add(new DartlingModels(dartlingDomain)); 
  } 
 
} 
 
