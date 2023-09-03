class Matematika{
  int hasil(){
    return 0;
  }
}

class Kpk implements Matematika{
  int x;
  int y;
  
  Kpk(this.x, this.y);
  @override
  int hasil(){
    return kpk(x, y);
  }

  int kpk(int x, int y) {
    int max = x > y ? x : y;
    int kpk = max;

    while (true) {
      if (kpk % x == 0 && kpk % y == 0) {
        return kpk;
      }
      kpk += max;
    }
  }
}

class Fpb implements Matematika{
  int x;
  int y;

  Fpb(this.x, this.y);
  @override
  int hasil() {
    return fpb(x,y);
  }

  int fpb(int x, int y) {
    while (y != 0) {
      final t = y;
      y = x % y;
      x = t;
    }
    return x;
  }
}

void main(){
  Kpk m1 = Kpk(20, 24);
  print(m1.hasil());

  Fpb m2 = Fpb(12, 6);
  print(m2.hasil());
}