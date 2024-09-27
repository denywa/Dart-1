import 'dart:io';

void validateChoice(Map<String, Function> pilihanLanjutanMap, String? choice) {
  while (!pilihanLanjutanMap.containsKey(choice)) {
    print("Pilihan tidak valid, coba lagi.");
    choice = stdin.readLineSync();
  }
}
