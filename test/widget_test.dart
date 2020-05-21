
import 'package:flutter_test/flutter_test.dart';
import 'package:company_project/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(App());

    // Verify that our counter starts at 0.
    expect(find.text('github'), findsOneWidget);
    expect(find.text('Github'), findsNothing);

  });
}
