void main() {
  List<int> nilai = [7, 5, 3, 5, 2, 1];

  int rataRata = calculateAverageAndRoundUp(nilai);
  print("Rata-rata (pembulatan ke atas): $rataRata");
}

int calculateAverageAndRoundUp(List<int> numbers) {
  if (numbers.isEmpty) {
    return 0;
  }

  double sum = 0;
  for (int number in numbers) {
    sum += number;
  }

  double average = sum / numbers.length;
  return average.ceil();
}
