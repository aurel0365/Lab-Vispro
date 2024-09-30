import 'dart:io';

void main () {
  print('masukkan suhu celcius untuk dikonversi: ');
  double celcius = double.parse(stdin.readLineSync()!);

  print('Silahkan pilih jenis konversi :');
  print('1. Farenheit');
  print('2. Reaumur');
  print('3. Kelvin');

  print('Masukkan nomor (1/2/3): ');
  int choice = int.parse(stdin.readLineSync()!);

   switch (choice) {
    case 1:
      double fahrenheit = (celcius * 9 / 5) + 32;
      print('$celcius °C = $fahrenheit °F');
      break;

    case 2:
      double reaumur = celcius * 0.8;
      print('$celcius °C = $reaumur °R');
      break;

    case 3:
      double kelvin = celcius + 273.15;
      print('$celcius °C = $kelvin K');
      break;
       
    default:
      print('Pilihan tidak valid');
  }
}

