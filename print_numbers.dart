import 'dart:io';

void printNumbers(List<int> numbers, int row, int i) {
  int j = 0;

  while (j < row && i < numbers.length) {
    stdout.write("${numbers[i]} "); // Cetak angka
    i++;
    j++;
  }
}
