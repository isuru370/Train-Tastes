import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:train_tastes/features/landing/presentation/pages/landing_page.dart';

void main() {
  testWidgets('landing page shows title, steps and both buttons', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: LandingPage()));

    // The train animation loops forever, so pump a fixed time
    // instead of pumpAndSettle.
    await tester.pump(const Duration(seconds: 3));

    expect(find.text('Train Tastes'), findsOneWidget);
    expect(find.text('Order tonight, 6 PM – 12 AM'), findsOneWidget);
    expect(find.text('Get started'), findsOneWidget);
    expect(find.text('I already have an account'), findsOneWidget);

    // Remove the page so the looping animation stops cleanly.
    await tester.pumpWidget(const SizedBox());
  });
}
