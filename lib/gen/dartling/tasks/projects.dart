part of dartling_tasks; 
 
// lib/gen/dartling/tasks/projects.dart 
 
abstract class ProjectGen extends ConceptEntity<Project> { 
 
  ProjectGen(Concept concept) { 
    this.concept = concept;
    Concept taskConcept = concept.model.concepts.singleWhereCode("Task"); 
    setChild("tasks", new Tasks(taskConcept)); 
  } 
 
  ProjectGen.withId(Concept concept, String name) { 
    this.concept = concept;
    setAttribute("name", name); 
    Concept taskConcept = concept.model.concepts.singleWhereCode("Task"); 
    setChild("tasks", new Tasks(taskConcept)); 
  } 
 
  String get name => getAttribute("name"); 
  set name(String a) => setAttribute("name", a); 
  
  String get description => getAttribute("description"); 
  set description(String a) => setAttribute("description", a); 
  
  Tasks get tasks => getChild("tasks"); 
  
  Project newEntity() => new Project(concept); 
  Projects newEntities() => new Projects(concept); 
  
  int nameCompareTo(Project other) { 
    return name.compareTo(other.name); 
  } 
 
} 
 
abstract class ProjectsGen extends Entities<Project> { 
 
  ProjectsGen(Concept concept) {
    this.concept = concept;
  }
 
  Projects newEntities() => new Projects(concept); 
  Project newEntity() => new Project(concept); 
  
} 
 
