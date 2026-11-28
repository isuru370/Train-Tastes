import 'package:material_ui/material_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:train_tastes/core/di/injection.dart';
import 'package:train_tastes/features/auth/domain/repositories/auth_repository.dart';
import 'package:train_tastes/features/auth/presentation/pages/sign_in_page.dart';

import '../../helpers/fake_auth_repository.dart';

void main() {
  late FakeAuthRepository repo;

  setUp(() {
    repo = FakeAuthRepository();
    sl.registerSingleton<AuthRepository>(repo);
  });

  tearDown(() async {
    await sl.reset();
    repo.dispose();
  });

  Future<void> pumpPage(WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: SignInPage()));
    await tester.pumpAndSettle();
  }

  testWidgets('shows errors and does not call Firebase when fields are empty',
      (tester) async {
    await pumpPage(tester);

    await tester.tap(find.widgetWithText(FilledButton, 'Sign in'));
    await tester.pump();

    expect(find.text('Enter your email'), findsOneWidget);
    expect(find.text('Enter your password'), findsOneWidget);
    expect(repo.calls, isEmpty);
  });

  testWidgets('signs in with valid email and password', (tester) async {
    await pumpPage(tester);

    await tester.enterText(find.widgetWithText(TextFormField, 'Email'), 'kasun@example.com');
    await tester.enterText(find.widgetWithText(TextFormField, 'Password'), 'secret1');
    await tester.tap(find.widgetWithText(FilledButton, 'Sign in'));
    await tester.pump();

    expect(repo.calls, ['signInWithEmail:kasun@example.com']);
  });

  testWidgets('shows the error message in a SnackBar', (tester) async {
    repo.error = wrongPassword;
    await pumpPage(tester);

    await tester.enterText(find.widgetWithText(TextFormField, 'Email'), 'kasun@example.com');
    await tester.enterText(find.widgetWithText(TextFormField, 'Password'), 'wrong12');
    await tester.tap(find.widgetWithText(FilledButton, 'Sign in'));
    await tester.pumpAndSettle();

    expect(find.text(wrongPassword.message), findsOneWidget);

    // Let the SnackBar timer finish so the test ends cleanly.
    await tester.pump(const Duration(seconds: 5));
    await tester.pumpAndSettle();
  });
}
