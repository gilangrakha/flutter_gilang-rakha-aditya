import 'dart:io';

void main(){
  int tinggi;

  stdout.write('Masukkan tinggi piramid : ');
  String input = stdin.readLineSync()!;
  
  tinggi = int.parse(input);

  for(int i=1; i<=tinggi; i++){
    String bintang = '*' * (2*i-1);
    String spasi = ' ' * (tinggi-i);

    print (spasi + bintang);
  }
}