import 'bubble.dart';
import 'shuffle.dart';

List<int> bubbleSort(List<int> angka) {
  int n = angka.length;
  return bubbleSortRecursive(angka, n);
}

List<int> bubbleSortRecursive(List<int> angka, int n) {
  if (n == 1) return angka;
  bubblePass(angka, n - 1);
  return bubbleSortRecursive(angka, n - 1);
}

List<int> inverse(List<int> angka) {
  return angka.reversed.toList();
}

List<int> shuffle(List<int> angka) {
  return shuffleList(angka);
}
