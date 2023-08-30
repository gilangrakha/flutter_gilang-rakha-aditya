import 'classBerat.dart';

class Mobil{
  int kapasitas;
  List<Hewan> muatan = [];

  Mobil(this.kapasitas);

  void tambahMuatan(Hewan hewan){
    if(muatan.length < kapasitas){
      muatan.add(hewan);
      print('Kapasitas cukup! hewan berhasil ditambahkan');
    } else{
      print('Kapasitas penuh! hewan tidak bisa ditambahkan');
    }
  }

  int totalMuatan(){
    int total = 0;
    for (var hewan in muatan){
      total += hewan.berat;
    }
    return total;
  }
}