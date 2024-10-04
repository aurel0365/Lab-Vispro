import 'dart:io';
import 'randomnumber.dart';
import 'utils.dart';
import 'pyramid.dart';
import 'repeat.dart';

void main() {
  bool ulang = true;

  while (ulang) {
    stdout.write('Masukkan jumlah angka acak yang diinginkan: ');
    int count = int.parse(stdin.readLineSync()!);

    List<int> angka = generateRandomNumbers(count);
    print('Angka Acak: $angka');

    print('Pilihan Menu:');
    print('1. Bubble Sort');
    print('2. Inversion');
    print('3. Shuffle');
    stdout.write('Pilihan Menu: ');

    int pilihan = int.parse(stdin.readLineSync()!);

    if (pilihan == 1) {
      angka = bubbleSort(angka);
      print('Sorted numbers: $angka');
    } else if (pilihan == 2) {
      angka = inverse(angka);
      print('Inverted numbers: $angka');
    } else if (pilihan == 3) {
      angka = shuffle(angka);
      print('Shuffled numbers: $angka');
    } else {
      print('Pilihan tidak valid!');
    }

    stdout.write('Masukkan jumlah baris piramida: ');
    int baris = int.parse(stdin.readLineSync()!);
    printPyramid(baris);

    ulang = repeat();
  }
  print('Terima kasih!');
}
