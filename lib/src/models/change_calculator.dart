// Simple function to find how many notes for change
Map<int, int> calculateChange(int total) {
  List<int> notesList = [500, 100, 50, 20, 10, 5, 2, 1];
  int left = total;
  Map<int, int> count = {};
  for (int note in notesList) {
    count[note] = left ~/ note;
    left %= note;
  }
  return count;
}
