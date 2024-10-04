void swap(List<int> angka, int i) {
  int temp = angka[i];
  angka[i] = angka[i + 1];
  angka[i + 1] = temp;
}
