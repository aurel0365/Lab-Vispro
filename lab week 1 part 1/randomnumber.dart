import 'dart:math';

List<int> generateRandomNumbers(int count) {
  Random random = Random();
  return List<int>.generate(count, (_) => random.nextInt(100));  // Generates numbers between 0 and 99.
}
