import 'classBerat.dart';
import 'classMobil.dart';

void main(){
  Hewan gajah = Hewan(200);
  Hewan kuda = Hewan(80);

  Mobil truck = Mobil(300);
  truck.tambahMuatan(gajah);
  truck.tambahMuatan(kuda);

  print('Total muatan dalam mobil: ${truck.totalMuatan()} kg');
}