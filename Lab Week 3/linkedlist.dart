import 'dart:async';
import 'dart:collection';
import 'dart:io';

const String clearConsole = "\x1B[2J\x1B[H";
const String hideCursor = "\x1B[?25l";
const String showCursor = "\x1B[?25h";
const String resetCursor = "\x1B[H"; 
const String resetTextColor = "\x1B[0m";

const List<String> textColors = [
  "\x1B[35m", 
  "\x1B[96m", 
  "\x1B[32m",
];

base class Letter extends LinkedListEntry<Letter> {
  String character; 
  String colorCode; 
  Letter(this.character, {this.colorCode = resetTextColor});
}

void main() {
  stdout.write("Masukkan nama: "); 
  String userName = stdin.readLineSync() ?? 'USER'; 

  final terminalWidth = stdout.terminalColumns; 
  final terminalHeight = stdout.terminalLines; 
  final totalCells = terminalWidth * terminalHeight; 
  final String displayChars = userName.isNotEmpty ? userName : "USER";

  final List<LinkedList<Letter>> displayGrid = List.generate(terminalHeight, (_) {
    final row = LinkedList<Letter>();
    for (int i = 0; i < terminalWidth; i++) {
      row.add(Letter(' ')); 
    }
    return row;
  });

  int charIndex = 0;  
  bool isNamePrinted = false; 
  int colorChangeIndex = 0; 

  void renderGrid() {
    stdout.write(resetCursor); 
    for (var row in displayGrid) {
      for (var letter in row) {
        stdout.write("${letter.colorCode}${letter.character}"); 
      }
    }
    stdout.write(resetTextColor); 
  }

  Future<void> animateDisplay() async {
    while (charIndex < totalCells && !isNamePrinted) {
      int row = (charIndex ~/ terminalWidth) % terminalHeight; 
      int col = (charIndex % terminalWidth); 

      var currentRow = displayGrid[row];
      var currentLetterNode = currentRow.first;

      for (int i = 0; i < col; i++) {
        currentLetterNode = currentLetterNode.next!;
      }

      if ((row % 2) == 0) {
        currentLetterNode.character = displayChars[charIndex % displayChars.length];
      } else {
        int reversedCol = terminalWidth - 1 - col; 
        currentLetterNode = currentRow.first;
        for (int i = 0; i < reversedCol; i++) {
          currentLetterNode = currentLetterNode.next!;
        }
        currentLetterNode.character = displayChars[charIndex % displayChars.length];
      }

      stdout.write(hideCursor); 
      renderGrid();
      charIndex++;

      await Future.delayed(Duration(milliseconds: 50)); 

      if (charIndex >= totalCells) {
        isNamePrinted = true;
        charIndex = 0; 
      }
    }

    while (isNamePrinted && charIndex < totalCells && colorChangeIndex < textColors.length) {
      int row = (charIndex ~/ terminalWidth) % terminalHeight; 
      int col = (charIndex % terminalWidth); 

      var currentRow = displayGrid[row];
      var currentLetterNode = currentRow.first;

      for (int i = 0; i < col; i++) {
        currentLetterNode = currentLetterNode.next!;
      }

      if ((row % 2) == 0) {
        currentLetterNode.colorCode = textColors[colorChangeIndex % textColors.length]; 
      } else {
        int reversedCol = terminalWidth - 1 - col; 
        currentLetterNode = currentRow.first;
        for (int i = 0; i < reversedCol; i++) {
          currentLetterNode = currentLetterNode.next!;
        }
        currentLetterNode.colorCode = textColors[colorChangeIndex % textColors.length]; 
      }

      stdout.write(hideCursor); 
      renderGrid();
      charIndex++;

      await Future.delayed(Duration(milliseconds: 50)); 

      if (charIndex >= totalCells) {
        colorChangeIndex++; 
        charIndex = 0; 
      }
    }

    stdout.write(showCursor); 
  }

  animateDisplay();
}
