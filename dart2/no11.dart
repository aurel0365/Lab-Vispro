import 'dart:io';
void main () {
  const int bateraiawal = 100;

  const int waktuchatting = 60;
  const int waktugame = 45;
  const int waktuvideo = 30;

  const double konsumsichat = 0.1;
  const double konsumsigame = 0.3;
  const double konsumsivideo = 0.2;

  double totalkonsumsi = (waktugame/5) + (waktuvideo/5) +(waktugame/5);
  print('Total konsumsi : $totalkonsumsi');

  double totalbaterai = bateraiawal - totalkonsumsi;
  print('Total Baterai keseluruhan : $totalbaterai');
}
 
   


   