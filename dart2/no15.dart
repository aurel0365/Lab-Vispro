import 'dart:collection';

void main() {
  Map<String, List<String>> stages = {
    'A': [],
    'B': ['A'],
    'C': ['B'],
    'D': ['A'],
    'E': ['D'],
    'F': ['C', 'E'],
  };

  List<String> executionOrder = findExecutionOrder(stages);
  
  print('Urutan pengerjaan yang paling efesien yaitu:');
  executionOrder.forEach((stage) => print(stage));
}

List<String> findExecutionOrder(Map<String, List<String>> stages) {
  Map<String, int> indegrees = {};
  Queue<String> availableStages = Queue<String>();

  stages.forEach((stage, dependencies) {
    indegrees[stage] = 0;
    dependencies.forEach((dependency) {
      indegrees[dependency] = (indegrees[dependency] ?? 0) + 1;
    });
  });

  indegrees.forEach((stage, count) {
    if (count == 0) availableStages.add(stage);
  });

  List<String> sortedStages = [];

  while (availableStages.isNotEmpty) {
    String currentStage = availableStages.removeFirst();
    sortedStages.add(currentStage);
    stages[currentStage]?.forEach((dependency) {
      indegrees[dependency] = indegrees[dependency]! - 1;
      if (indegrees[dependency] == 0) availableStages.add(dependency);
    });
  }

  return sortedStages;
}
