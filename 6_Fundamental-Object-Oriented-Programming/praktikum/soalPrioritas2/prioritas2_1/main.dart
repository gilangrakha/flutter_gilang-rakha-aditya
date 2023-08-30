import 'classCalculator.dart';
import 'dart:io';
void main(){
  Calculator kalkulator = Calculator();

  double angka1;
  double angka2;

  stdout.write('Masukkan angka pertama : ');
  angka1 = double.parse(stdin.readLineSync()!);

  stdout.write('Masukkan angka pertama : ');
  angka2 = double.parse(stdin.readLineSync()!);

  print('Hasil penjumlahan $angka1 + $angka2 = ${kalkulator.penjumlahan(angka1, angka2)}');
  print('Hasil pengurangan $angka1 - $angka2 = ${kalkulator.pengurangan(angka1, angka2)}');
  print('Hasil perkalian $angka1 * $angka2 = ${kalkulator.perkalian(angka1, angka2)}');
  print('Hasil pembagian $angka1 / $angka2 = ${kalkulator.pembagian(angka1, angka2)}');
}