import 'dart:io';

void main() {
  stdout.write("Masukkan sebuah angka: ");
  int angka = int.parse(stdin.readLineSync()!);

  List<int> faktor = findFactors(angka);

  print("Faktor dari $angka adalah: $faktor");
}

List<int> findFactors(int number) {
  List<int> faktor = [];

  for (int i = 1; i <= number; i++) {
    if (number % i == 0) {
      faktor.add(i);
    }
  }

  return faktor;
}
