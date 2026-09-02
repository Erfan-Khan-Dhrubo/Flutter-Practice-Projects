class ChangeCalculator {

  static const List<int> denominations = [500, 100, 50, 20, 10, 5, 2, 1];

  static Map<int, int> calculateChange(int amount) {

    final Map<int, int> counts = {};
    for (final int note in denominations) {
      counts[note] = 0;
    }


    if (amount <= 0) {
      return counts;
    }

    int remaining = amount;

    for (final int note in denominations) {
      counts[note] = remaining ~/ note;
      remaining = remaining % note;
    }

    return counts;
  }
}
