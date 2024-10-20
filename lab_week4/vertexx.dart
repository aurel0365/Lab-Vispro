import 'dart:collection';

typedef AdjList = Map<String, Map<String, int>>;

class Graph {
  final AdjList adjacencyList = {};

  void addEdge(String vertex1, String vertex2, int weight) {
    adjacencyList.putIfAbsent(vertex1, () => {})[vertex2] = weight;
    adjacencyList.putIfAbsent(vertex2, () => {})[vertex1] = weight;
  }

  int getDistance(String from, String to) {
    return adjacencyList[from]?[to] ?? -1;
  }

  void findShortestPath(String start) {
    List<String> vertices = adjacencyList.keys.where((v) => v != start).toList();

    int minPathWeight = double.maxFinite.toInt();
    List<String> bestPath = [];

    List<List<String>> allPermutations = _generatePermutations(vertices);

    for (var perm in allPermutations) {
      int currentWeight = 0;
      String currentVertex = start;
      bool isValidRoute = true;

      for (var nextVertex in perm) {
        int distance = getDistance(currentVertex, nextVertex);
        if (distance == -1) {
          isValidRoute = false;
          break;
        }
        currentWeight += distance;
        currentVertex = nextVertex;
      }

      if (isValidRoute) {
        int returnDistance = getDistance(currentVertex, start);
        if (returnDistance != -1) {
          currentWeight += returnDistance;
        } else {
          isValidRoute = false;
        }
      }

      if (isValidRoute && currentWeight < minPathWeight) {
        minPathWeight = currentWeight;
        bestPath = perm;
      }
    }

    if (bestPath.isNotEmpty) {
      printRoute(start, bestPath, minPathWeight);
    } else {
      print('No valid route found!');
    }
  }

  void printRoute(String start, List<String> path, int totalWeight) {
    print('Starting at: $start');
    String currentVertex = start;
    for (String nextVertex in path) {
      int distance = getDistance(currentVertex, nextVertex);
      print('Moving to: $nextVertex with distance: $distance');
      currentVertex = nextVertex;
    }

    int returnDistance = getDistance(currentVertex, start);
    print('Returning to start ($start) with distance: $returnDistance');

    print('\nBest route: $start -> ${path.join(" -> ")} -> $start');
    
    print('Total distance of the path: ${totalWeight}');
  }

  List<List<String>> _generatePermutations(List<String> list) {
    if (list.length == 1) return [list];

    List<List<String>> permutations = [];
    for (int i = 0; i < list.length; i++) {
      List<String> remaining = List.from(list)..removeAt(i);
      List<List<String>> subPermutations = _generatePermutations(remaining);
      for (var perm in subPermutations) {
        permutations.add([list[i], ...perm]);
      }
    }
    return permutations;
  }
}

void main() {
  Graph graph = Graph();

  graph.addEdge('A', 'B', 8);
  graph.addEdge('A', 'C', 3);
  graph.addEdge('A', 'D', 4);
  graph.addEdge('A', 'E', 10);
  graph.addEdge('B', 'C', 5);
  graph.addEdge('B', 'D', 2);
  graph.addEdge('B', 'E', 7);
  graph.addEdge('C', 'D', 1);
  graph.addEdge('C', 'E', 6);
  graph.addEdge('D', 'E', 3);

  graph.findShortestPath('A');
}