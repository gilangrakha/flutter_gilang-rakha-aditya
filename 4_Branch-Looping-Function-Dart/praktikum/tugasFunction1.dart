import 'dart:io';

void luaslingkaran(){
  double jarijari;

  stdout.write('Masukkan jari-jari lingkaran : ');
  jarijari = double.parse(stdin.readLineSync()!);

  double luas = 22/7*jarijari*jarijari;
  print('luas lingkaran adalah $luas');
}

void main(){
  luaslingkaran();
}