import 'dart:io';

int hitungFaktorial(int n) {
  if (n == 0 || n == 1) {
    return 1;
  } else {
    return n * hitungFaktorial(n - 1);
  }
}

void main() {
  int berapa;
  stdout.write('berapa jumlah angka yang akan anda faktorialkan? : ');
  berapa = int.parse(stdin.readLineSync()!);

  for(int i=berapa; i>=1; i--){
    stdout.write('Masukkan angka: ');
    int angka = int.parse(stdin.readLineSync()!);

    int faktorial = hitungFaktorial(angka);
    print("Faktorial dari $angka adalah : $faktorial\n");
  }

  print('\nTerimakasih sudah menggunakan program ini!');
}