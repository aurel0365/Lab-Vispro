import 'inversi.dart';  

void bubblePass(List<int> angka, int n) {
  int i = 0;
  while (i < n - 1) {
    if (angka[i] > angka[i + 1]) {
      swap(angka, i);
    }
    i++;
  }
}
