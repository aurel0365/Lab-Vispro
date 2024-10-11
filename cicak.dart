import 'dart:io';
import 'dart:math';

void clearConsole() {
  print("\x1B[2J\x1B[0;0H");
}

Future<void> delay(int milliseconds) async {
  await Future.delayed(Duration(milliseconds: milliseconds));
}

int getRandomInt(int min, int max) {
  return min + Random().nextInt(max - min);
}

List<int> getTerminalSize() {
  return [stdout.terminalColumns, stdout.terminalLines];
}

void setCursorPosition(int row, int col) {
  stdout.write('\x1B[${row};${col}H');
}

void spawnFood() {
  foodPosition = Point(getRandomInt(3, gridWidth), getRandomInt(3, gridHeight));
  while (snakeBody.contains(foodPosition)) {
    foodPosition = Point(getRandomInt(3, gridWidth), getRandomInt(3, gridHeight));
  }
}

int gridWidth = getTerminalSize()[0] - 3;
int gridHeight = getTerminalSize()[1] - 3;

int initialX = getRandomInt(3, gridWidth);
int initialY = getRandomInt(3, gridHeight);

List<Point<int>> snakeBody = [
  Point(initialX, initialY),
  Point(initialX - 1, initialY),
  Point(initialX - 2, initialY),
  Point(initialX - 3, initialY),
  Point(initialX - 4, initialY)
];

Point<int> foodPosition = Point(getRandomInt(3, gridWidth), getRandomInt(3, gridHeight));

Point<int> lastMovement = Point(1, 0);

void main() async {
  clearConsole();
  bool isRunning = true;

  if (isRunning) {
    stdin.echoMode = false;
    stdin.lineMode = false;

    while (true) {
      gridWidth = getTerminalSize()[0] - 3;
      gridHeight = getTerminalSize()[1] - 3;

      if (!updateSnakePosition()) {
        clearConsole();
        print("Game Over!");
        break;
      }
      renderGrid();
      await delay(100);
    }
  }
}

bool updateSnakePosition() {
  final head = snakeBody.first;

  Point<int>? nextMove = determineNextStep(head, foodPosition);

  if (nextMove != null) {
    snakeBody.insert(0, nextMove);
    lastMovement = Point(nextMove.x - head.x, nextMove.y - head.y);

    if (nextMove.x < 0 || nextMove.x >= gridWidth || nextMove.y < 0 || nextMove.y >= gridHeight || snakeBody.sublist(1).contains(nextMove)) {
      return false;
    }

    if (nextMove == foodPosition) {
      spawnFood();
    } else {
      snakeBody.removeLast();
    }
  }
  return true;
}

Point<int>? determineNextStep(Point<int> start, Point<int> target) {
  List<Point<int>> possibleDirections = [
    Point(0, 1),
    Point(1, 0),
    Point(0, -1),
    Point(-1, 0)
  ];

  possibleDirections.removeWhere((direction) => direction == Point(-lastMovement.x, -lastMovement.y));

  Point<int>? bestStep;
  int minDistance = double.maxFinite.toInt();

  for (var direction in possibleDirections) {
    Point<int> newPosition = Point(start.x + direction.x, start.y + direction.y);

    if (newPosition.x >= 0 && newPosition.x < gridWidth && newPosition.y >= 0 && newPosition.y < gridHeight && !snakeBody.contains(newPosition)) {
      int distance = (newPosition.x - target.x).abs() + (newPosition.y - target.y).abs();
      if (distance < minDistance) {
        minDistance = distance;
        bestStep = newPosition;
      }
    }
  }

  if (bestStep == null) {
    Point<int> backwardStep = Point(start.x - lastMovement.x, start.y - lastMovement.y);
    if (backwardStep.x >= 0 && backwardStep.x < gridWidth && backwardStep.y >= 0 && backwardStep.y < gridHeight) {
      bestStep = backwardStep;
    }
  }

  return bestStep;
}

void renderGrid() {
  clearConsole();

  int segmentIndex = 1;
  int previousX = 0;
  int previousY = 0;

  for (var segment in snakeBody) {
    setCursorPosition(segment.y + 1, segment.x + 1);

    if (segmentIndex == 2 || segmentIndex == snakeBody.length - 1) {
      stdout.write('.');
      if (previousX != segment.x) {
        setCursorPosition(segment.y + 2, segment.x + 1);
        stdout.write('.');
        setCursorPosition(segment.y, segment.x + 1);
        stdout.write('.');
      } else {
        setCursorPosition(segment.y + 1, segment.x + 1);
      }
    } else {
      stdout.write('.');
    }
    previousX = segment.x;
    previousY = segment.y;
    segmentIndex++;
  }

  setCursorPosition(snakeBody.first.y + 1, snakeBody.first.x + 1);
  stdout.write('.');

  setCursorPosition(foodPosition.y + 1, foodPosition.x + 1);
  stdout.write('o');
}
