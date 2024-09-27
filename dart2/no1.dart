import 'dart:io';
void main () {
  const int hargaApelperKG = 5000;
  const int hargaJerukperKG = 5000;

  stdout.write('Masukkan Jumlah KG Apel : ');
  int jumlahApel = int.parse(stdin.readLineSync()!);

  
  stdout.write('Masukkan Jumlah KG Jeruk : ');
  int jumlahJeruk = int.parse(stdin.readLineSync()!);
  
  int TotalHarga = (jumlahJeruk * hargaJerukperKG) + (jumlahApel* hargaApelperKG);

  print('Total Harga Jeruk dan Apel : $TotalHarga');

} 