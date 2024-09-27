import 'dart:io';
import 'dart:math';
import 'package:dart_application_1/piramida.dart'; // Import file piramida.dart
import 'package:dart_application_1/pilihanLanjutanMap.dart'; // Import file pilihanLanjutanMap.dart


// Fungsi untuk meminta input angka dari user
int getInput() {
  print("Masukkan jumlah angka yang ingin di-generate: ");
  return int.tryParse(stdin.readLineSync() ?? "") ?? 0;
}

// Fungsi untuk mengenerate angka random
List<int> generateRandomNumbers(int count) {
  return List<int>.generate(count, (_) => Random().nextInt(100));
}

// Fungsi Bubblesort
List<int> bubblesort(List<int> numbers, int length) {
  int swapCounter = 0;

  void swapAndCheck(int i) {
    if (i < length - 1) {
      (numbers[i] > numbers[i + 1])
          ? (() {
              int temp = numbers[i];
              numbers[i] = numbers[i + 1];
              numbers[i + 1] = temp;
              swapCounter++;
            })()
          : null;
      swapAndCheck(i + 1);
    }
  }

  swapAndCheck(0);

  return (length == 1 || swapCounter == 0) ? numbers : bubblesort(numbers, length - 1);
}

// Fungsi inversi 
List<int> inversi(List<int> numbers) {
  return numbers.reversed.toList();
}

// Fungsi shuffle
List<int> shuffleList(List<int> numbers) {
  numbers.shuffle();
  return numbers;
}

// Fungsi utama
void main() {
  int inputCount = getInput();

  // Generate angka random
  List<int> randomNumbers = generateRandomNumbers(inputCount);
  print("Angka random yang di-generate: $randomNumbers");

  // Menampilkan pilihan dan meminta input pilihan dari user
  print("\nPilih metode:");
  print("1. Bubble Sort");
  print("2. Inversi");
  print("3. Shuffle");

  String? choice = stdin.readLineSync();

  var pilihanMap = {
    '1': (List<int> nums) {
      Stopwatch stopwatch = Stopwatch()..start();
      var result = bubblesort(nums, nums.length);
      stopwatch.stop();
      print("Waktu eksekusi Bubble Sort: ${stopwatch.elapsedMilliseconds}ms");
      return result;
    },
    '2': (List<int> nums) {
      Stopwatch stopwatch = Stopwatch()..start();
      var result = inversi(nums);
      stopwatch.stop();
      print("Waktu eksekusi Inversi: ${stopwatch.elapsedMilliseconds}ms");
      return result;
    },
    '3': (List<int> nums) {
      Stopwatch stopwatch = Stopwatch()..start();
      var result = shuffleList(nums);
      stopwatch.stop();
      print("Waktu eksekusi Shuffle: ${stopwatch.elapsedMilliseconds}ms");
      return result;
    }
  };

  while (!pilihanMap.containsKey(choice)) {
    print("Pilihan tidak valid, coba lagi.");
    choice = stdin.readLineSync();
  }

  // Eksekusi pilihan user dan cetak hasilnya
  List<int> result = pilihanMap[choice]!(List<int>.from(randomNumbers));
  print("Angka setelah diproses: $result");

  // Menampilkan pilihan lanjutan dan meminta input dari user
  print("\nPilih metode lanjutan:");
  print("1. Cetak Piramida");
  print("2. Cetak Piramida Berurut");

  choice = stdin.readLineSync();

  var pilihanLanjutanMap = {
    '1': (List<int> nums) {
      Stopwatch stopwatch = Stopwatch()..start();
      printPyramid(nums);
      stopwatch.stop();
      print("Waktu eksekusi Cetak Piramida: ${stopwatch.elapsedMilliseconds}ms");
    },
    '2': (List<int> nums) {
      Stopwatch stopwatch = Stopwatch()..start();
      printSortedPyramid(nums);
      stopwatch.stop();
      print("Waktu eksekusi Cetak Piramida Berurut: ${stopwatch.elapsedMilliseconds}ms");
    }
  };

  validateChoice(pilihanLanjutanMap, choice);

  // Eksekusi pilihan lanjutan user
  pilihanLanjutanMap[choice]!(List<int>.from(result));
}
