void printPyramid(int rows, [int currentRow = 1]) {
  if (currentRow > rows) return;

  print(' ' * (rows - currentRow) + '*' * (2 * currentRow - 1));
  printPyramid(rows, currentRow + 1); 
}
