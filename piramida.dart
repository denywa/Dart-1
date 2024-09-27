import 'dart:io';
import 'package:dart_application_1/print_numbers.dart';
import 'package:dart_application_1/print_space.dart';

void printPyramid(List<int> numbers) {
  int n = numbers.length;
  int i = 0;
  int row = 1;

  while (i < n) {
    if (row <= n) {
      printSpace(n, row); // Cetak spasi
      printNumbers(numbers, row, i); // Cetak angka
      stdout.writeln();
      i += row; // Update index i sesuai dengan jumlah angka yang sudah dicetak
      row++; // Naikkan baris
    }
  }
}
void printSortedPyramid(List<int> numbers) {
  List<int> sortedNumbers = List.from(numbers)..sort(); // Sort the numbers
  printPyramid(sortedNumbers); // Use the same pyramid function
}