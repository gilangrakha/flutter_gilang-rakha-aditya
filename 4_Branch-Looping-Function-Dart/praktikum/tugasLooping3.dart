import 'dart:io';

void main(){
  int tinggi;

  stdout.write('Masukkan tinggi piramid : ');
  String input = stdin.readLineSync()!;
  
  tinggi = int.parse(input);

  //bagian atas jam pasir
  for(int i=tinggi-1; i>=1 ; i--){
    String bintang = '*' * (2*i-1);
    String spasi = ' ' * (tinggi-i);

    print (spasi + bintang);
  }
  //bagian bawah jam pasir
  for(int i=1; i<=tinggi; i++){
    String bintang = '*' * (2*i-1);
    String spasi = ' ' * (tinggi-i);

    print (spasi + bintang);
  }
}