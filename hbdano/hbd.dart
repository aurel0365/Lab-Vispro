import 'dart:async';
import 'dart:io';
import 'dart:math';

void main() async {
  int numberOfFireworks = getNumberOfFireworks();
  FireworkSimulator simulator = FireworkSimulator(numberOfFireworks);
  await simulator.start();
}

int getNumberOfFireworks() {
  int? numberOfFireworks;
  while (numberOfFireworks == null) {
    stdout.write('Masukkan jumlah kembang api: ');
    String? input = stdin.readLineSync();
    try {
      numberOfFireworks = int.parse(input!);
      if (numberOfFireworks <= 0) {
        throw FormatException();
      }
    } catch (e) {
      print('Harap masukkan angka positif yang valid.');
    }
  }
  return numberOfFireworks;
}

class FireworkSimulator {
  final int numberOfFireworks;
  final Random random = Random();
  final List<String> colors = [
    '\x1B[31m', // Merah
    '\x1B[32m', // Hijau
    '\x1B[33m', // Kuning
    '\x1B[34m', // Biru
    '\x1B[35m', // Magenta
    '\x1B[36m', // Cyan
    '\x1B[37m', // Putih
  ];
  final List<String> backgroundColors = [
    '\x1B[41m',
    '\x1B[42m',
    '\x1B[43m',
    '\x1B[44m',
    '\x1B[45m',
    '\x1B[46m',
    '\x1B[47m',
  ];
  final String resetColor = '\x1B[0m';

  FireworkSimulator(this.numberOfFireworks);

  Future<void> start() async {
    for (int i = 0; i < numberOfFireworks; i++) {
      await launchFirework(i == numberOfFireworks - 1, i);
      await Future.delayed(Duration(milliseconds: 500));
    }
  }

  Future<void> launchFirework(bool isLastFirework, int index) async {
    String fireworkColor = colors[random.nextInt(colors.length)];
    String backgroundColor = backgroundColors[colors.indexOf(fireworkColor)];
    int screenHeight = stdout.terminalLines;
    int screenWidth = stdout.terminalColumns;
    int centerX;

    // Tentukan posisi eksplosi
    if (index == 0) {
      // Firework pertama meledak di tengah
      centerX = (screenWidth / 2).round();
    } else {
      // Firework kedua dan seterusnya meledak di kiri atau kanan
      centerX = random.nextBool() ? (screenWidth ~/ 4) : (screenWidth * 3 ~/ 4);
    }

    // Proses peluncuran kembang api
    for (int y = screenHeight - 1; y >= screenHeight ~/ 2; y--) {
      await Future.delayed(Duration(milliseconds: 50), () {
        clearScreen();
        moveCursor(y, centerX);
        stdout.write('$fireworkColor-$resetColor');
      });
    }

    // Eksplosi
    await Future.delayed(Duration(milliseconds: 100), () {
      explode(centerX, screenHeight ~/ 2, fireworkColor, backgroundColor);
    });

    await Future.delayed(Duration(milliseconds: 1000), () {
      clearScreen();
    });

    // Tampilkan pesan setelah firework terakhir
    if (isLastFirework) {
      await Future.delayed(Duration(milliseconds: 500), () {
        clearScreen();
        displayHBDANO();
      });
    }
  }

  void explode(int centerX, int centerY, String fireworkColor, String backgroundColor) {
    int explosionRadius = 5;

    // Bersihkan layar
    stdout.write(backgroundColor);
    for (int y = 0; y < stdout.terminalLines; y++) {
      for (int x = 0; x < stdout.terminalColumns; x++) {
        moveCursor(y, x);
        stdout.write(' ');
      }
    }

    // Simulasikan eksplosi
    for (int i = 0; i < 20; i++) {
      Future.delayed(Duration(milliseconds: i * 25), () {
        int offsetX = random.nextInt(explosionRadius * 2) - explosionRadius;
        int offsetY = random.nextInt(explosionRadius * 2) - explosionRadius;

        int newX = (centerX + offsetX).clamp(0, stdout.terminalColumns - 1);
        int newY = (centerY + offsetY).clamp(0, stdout.terminalLines - 1);

        moveCursor(newY, newX);
        stdout.write('$fireworkColor-$resetColor');
      });
    }

    Future.delayed(Duration(milliseconds: 500), () {
      clearScreen();
    });
  }

  void displayHBDANO() {
    List<String> bigText = [
      '=   =  =====  ====         =     =   =  === ',
      '=   =  =    = =   =       = =    ==  = =   =',
      '=====  =====  =   =      =====   = = = =   =',
      '=   =  =    = =   =     =     =  =  == =   =',
      '=   =  =====  ====     =       = =   =  === ',
    ];

    int screenHeight = stdout.terminalLines;
    int screenWidth = stdout.terminalColumns;

    int startY = (screenHeight ~/ 2) - (bigText.length ~/ 2);
    int startX = (screenWidth ~/ 2) - (bigText[0].length ~/ 2);

    for (int i = 0; i < bigText.length; i++) {
      Future.delayed(Duration(milliseconds: 500 * i), () {
        moveCursor(startY + i, startX);
        stdout.write(bigText[i]);
      });
    }
  }

  void clearScreen() {
    stdout.write('\x1B[2J');
    stdout.write('\x1B[H');
  }

  void moveCursor(int x, int y) {
    stdout.write('\x1B[${x};${y}H');
  }
}
