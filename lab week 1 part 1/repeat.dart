import 'dart:io';

bool repeat() {
  stdout.write('Apakah anda ingin mengulang? (y/t): ');
  String jawaban = stdin.readLineSync()!.trim().toLowerCase();
  return jawaban == 'y';
}
