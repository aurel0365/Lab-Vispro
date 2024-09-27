import 'dart:io';
void main () {
  const int unitperjam = 20;
  const int Jjamkerja = 8;
  const int Jharikerja = 5;

  int totalperhari = unitperjam * Jjamkerja;
  print('Total per hari : $totalperhari');

  int totalpermgg = totalperhari * Jharikerja;
  print('Total unit barang dalam 1 minggu : $totalpermgg');
}
 
   


   