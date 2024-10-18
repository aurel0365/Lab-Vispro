import 'dart:math';

class Node<T> {
  T value;
  Node<T>? next;

  Node(this.value);
}

typedef AdjList = Map<String, Node<MapEntry<String, int>>>;

class Graph {
  final AdjList adjacencyList = {};

  void addEdge(String vertex1, String vertex2, int weight) {
    adjacencyList[vertex1] = _addToList(adjacencyList[vertex1], MapEntry(vertex2, weight));
    adjacencyList[vertex2] = _addToList(adjacencyList[vertex2], MapEntry(vertex1, weight)); // For undirected graph
  }

  Node<MapEntry<String, int>> _addToList(Node<MapEntry<String, int>>? node, MapEntry<String, int> entry) {
    return Node(entry)..next = node;
  }

  int getDistance(String from, String to) {
    Node<MapEntry<String, int>>? node = adjacencyList[from];
    while (node != null) {
      if (node.value.key == to) {
        return node.value.value;
      }
      node = node.next;
    }
    return -1; 
  }

  void findShortestPath(String start) {
    List<String> vertices = adjacencyList.keys.where((v) => v != start).toList();

    int minPathWeight = double.maxFinite.toInt();
    List<String> bestPath = [];

    List<List<String>> allPermutations = _generatePermutations(vertices);

    print('All possible routes : ');
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

      if (isValidRoute) {
        print('$start -> ${perm.join(' -> ')} -> $start | Total weight = $currentWeight');
        if (currentWeight < minPathWeight) {
          minPathWeight = currentWeight;
          bestPath = perm;
        }
      }
    }

    if (bestPath.isNotEmpty) {
      print('\nTHE MOST EFFECTIVE ROUTE');
      print('  Most effective route: $start -> ${bestPath.join(' -> ')} -> $start');
      print('  Total: $minPathWeight');
    } else {
      print('No valid route found!');
    }
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