import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:train_tastes/core/error/failure.dart';
import 'package:train_tastes/features/auth/presentation/cubit/auth_form_cubit.dart';

import '../../helpers/fake_auth_repository.dart';

void main() {
  late FakeAuthRepository repo;

  setUp(() => repo = FakeAuthRepository());
  tearDown(() => repo.dispose());

  group('AuthFormCubit', () {
    test('starts idle', () {
      expect(AuthFormCubit(repo).state, const AuthFormState());
    });

    blocTest<AuthFormCubit, AuthFormState>(
      'sign in: loading then success',
      build: () => AuthFormCubit(repo),
      act: (c) => c.signIn('kasun@example.com', 'secret1'),
      expect: () => const [
        AuthFormState(status: FormStatus.loading),
        AuthFormState(status: FormStatus.success),
      ],
      verify: (_) => expect(repo.calls, ['signInWithEmail:kasun@example.com']),
    );

    blocTest<AuthFormCubit, AuthFormState>(
      'sign in: shows the failure message',
      build: () => AuthFormCubit(repo),
      setUp: () => repo.error = wrongPassword,
      act: (c) => c.signIn('kasun@example.com', 'wrong'),
      expect: () => [
        const AuthFormState(status: FormStatus.loading),
        AuthFormState(status: FormStatus.failure, message: wrongPassword.message),
      ],
    );

    blocTest<AuthFormCubit, AuthFormState>(
      'sign up passes the name through',
      build: () => AuthFormCubit(repo),
      act: (c) => c.signUp('Kasun', 'kasun@example.com', 'secret1'),
      verify: (_) => expect(repo.calls, ['signUpWithEmail:Kasun:kasun@example.com']),
    );

    blocTest<AuthFormCubit, AuthFormState>(
      'closing Google sheet goes back to idle without an error',
      build: () => AuthFormCubit(repo),
      setUp: () => repo.error = const SignInCancelled(),
      act: (c) => c.signInWithGoogle(),
      expect: () => const [
        AuthFormState(status: FormStatus.loading),
        AuthFormState(),
      ],
    );

    blocTest<AuthFormCubit, AuthFormState>(
      'password reset shows a success message',
      build: () => AuthFormCubit(repo),
      act: (c) => c.sendPasswordReset('kasun@example.com'),
      expect: () => const [
        AuthFormState(status: FormStatus.loading),
        AuthFormState(
          status: FormStatus.success,
          message: 'Reset link sent. Check your email.',
        ),
      ],
    );

    blocTest<AuthFormCubit, AuthFormState>(
      'ignores a second tap while loading',
      build: () => AuthFormCubit(repo),
      act: (c) {
        c.signIn('a@b.lk', '123456');
        c.signIn('a@b.lk', '123456');
      },
      verify: (_) => expect(repo.calls.length, 1),
    );
  });
}
