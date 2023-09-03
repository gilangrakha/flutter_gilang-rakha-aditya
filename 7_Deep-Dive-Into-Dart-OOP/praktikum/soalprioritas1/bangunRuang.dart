class BangunRuang {
  int panjang;
  int lebar;
  int tinggi;

  BangunRuang(this.panjang, this.lebar, this.tinggi);

  int volume(){
    return 0;
  }
}

class Kubus extends BangunRuang{
  int sisi;

  Kubus(this.sisi):super(sisi, sisi, sisi);

  @override
  int volume() {
    return sisi*sisi*sisi;
  }
}

class Balok extends BangunRuang{

  Balok(int panjang, int lebar, int tinggi):super(panjang, lebar, tinggi);

  @override
  int volume() {
    return panjang*lebar*tinggi;
  }
}

void main(){
  Kubus kubus = Kubus(4);
  print(kubus.volume());

  Balok balok = Balok(2,3,4);
  print(balok.volume());
}