// Simple test for app launch
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('App starts and shows title', (tester) async {
    await tester.pumpWidget(VangtiChaiApp());

    expect(find.text('VangtiChai'), findsOneWidget);
  });
}
