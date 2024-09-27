import 'dart:io';

void printSpace(int n, int row) {
  int space = n - row; // Hitung jumlah spasi
  int j = 0;

  while (j < space) {
    stdout.write("  "); // Cetak dua spasi per unit
    j++;
  }
}