import 'package:flutter_test/flutter_test.dart';

import 'package:vangti_chai/main.dart';
import 'package:vangti_chai/widgets/number_button.dart';

void main() {
  testWidgets('VangtiChai keypad and change calculation smoke test',
      (WidgetTester tester) async {
    await tester.pumpWidget(const VangtiChaiApp());

    // App starts with Taka: 0
    expect(find.text('Taka: 0'), findsOneWidget);
    expect(find.text('VangtiChai'), findsOneWidget);

    // Enter 234 by tapping keypad digit buttons.
    await tester.tap(find.widgetWithText(NumberButton, '2'));
    await tester.pump();
    expect(find.text('Taka: 2'), findsOneWidget);

    await tester.tap(find.widgetWithText(NumberButton, '3'));
    await tester.pump();
    expect(find.text('Taka: 23'), findsOneWidget);

    await tester.tap(find.widgetWithText(NumberButton, '4'));
    await tester.pump();
    expect(find.text('Taka: 234'), findsOneWidget);

    // CLEAR resets the amount.
    await tester.tap(find.widgetWithText(NumberButton, 'CLEAR'));
    await tester.pump();
    expect(find.text('Taka: 0'), findsOneWidget);
  });
}
