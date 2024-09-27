import 'dart:io';
void main () {
  const double konsumsiAC = 1.5;
  const double konsumsiTV = 0.2;
  const double konsumsiLampu = 0.1;

  const int penggunaanAC = 8;
  const int penggunaanTV = 5;
  const int penggunaanLampu = 12;

  double totalkonsumsiseluruhnya = (konsumsiAC*penggunaanAC) + (konsumsiLampu*penggunaanLampu) +(konsumsiTV*penggunaanTV);
  print('Total Keseluruhan : $totalkonsumsiseluruhnya');

}
 
   


   