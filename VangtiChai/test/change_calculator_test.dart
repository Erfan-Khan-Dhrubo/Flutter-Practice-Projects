import 'package:flutter_test/flutter_test.dart';

import 'package:vangti_chai/utils/change_calculator.dart';

void main() {
  test('calculateChange for 234', () {
    final Map<int, int> result = ChangeCalculator.calculateChange(234);

    expect(result[500], 0);
    expect(result[100], 2);
    expect(result[50], 0);
    expect(result[20], 1);
    expect(result[10], 1);
    expect(result[5], 0);
    expect(result[2], 2);
    expect(result[1], 0);
  });

  test('calculateChange for 786', () {
    final Map<int, int> result = ChangeCalculator.calculateChange(786);

    expect(result[500], 1);
    expect(result[100], 2);
    expect(result[50], 1);
    expect(result[20], 1);
    expect(result[10], 1);
    expect(result[5], 1);
    expect(result[2], 0);
    expect(result[1], 1);
  });

  test('calculateChange for 0 clears all counts', () {
    final Map<int, int> result = ChangeCalculator.calculateChange(0);

    for (final int note in ChangeCalculator.denominations) {
      expect(result[note], 0);
    }
  });
}
