import 'dart:io';
void main(){
  int nilai;
  stdout.write("Masukkan sebuah angka: ");
  String input = stdin.readLineSync()!;

  nilai = int.parse(input);

  if (nilai>=70){
    print('Nilai A');
  } else if(nilai<70 && nilai>=40){
    print('Nilai B');
  } else if(nilai<40 && nilai>=0){
    print('Nilai C');
  } else {
    print('Nilai kosong');
  }
}