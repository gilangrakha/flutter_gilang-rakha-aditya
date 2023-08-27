Future<List<int>> multiplyList(List<int> data, int pengali) async {
  List<int> result = [];

  for (int elemen in data) { //Lakukan perulangan pada list data secara asynchronous
    await Future.delayed(Duration(seconds: 1));
    int multipliedValue = elemen * pengali; //Tiap perulangan, kalikan elemen list data dengan pengali
    result.add(multipliedValue);
  }

  return result;
}

void main() async {
  List<int> inputList = [1, 2, 3, 4, 5];
  int pengali = 10;

  List<int> multipliedList = await multiplyList(inputList, pengali);

  print("List input: $inputList");
  print("List hasil kali: $multipliedList");
}
