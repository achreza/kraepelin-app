import 'dart:math';

void main() {
  List<String>? pertanyaan = [];
  List<String>? jawaban = [];
  final _random = new Random();
  int next(int min, int max) => min + _random.nextInt(max - min);

  void generatePertanyaan() {
    for (var i = 0; i < 20; i++) {
      int angka1 = next(1, 10);
      int angka2 = next(1, 10);
      int jaw = angka1 + angka2;
      String ans = jaw.toString();
      String output = ans[ans.length - 1];

      pertanyaan!.add("$angka1 + $angka2 = ?");
      jawaban!.add(output);
    }
  }

  generatePertanyaan();
  print(pertanyaan![1]);
  print(jawaban![1]);
}
