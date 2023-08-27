void main() {
  List<List<String>> nestedList = [
    ['gilang', '25'],
    ['rakha', '30'],
    ['aditya', '22']
  ];

  Map<String, int> dataMap = {};

  for (List<String> subList in nestedList) {
    if (subList.length == 2) {
      String nama = subList[0];
      int usia = int.tryParse(subList[1]) ?? 0;
      dataMap[nama] = usia;
    }
  }

  print("Data Map: $dataMap");
}
