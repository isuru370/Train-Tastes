import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:train_tastes/features/auth/presentation/bloc/session_bloc.dart';

import '../../helpers/fake_auth_repository.dart';

void main() {
  late FakeAuthRepository repo;

  setUp(() => repo = FakeAuthRepository());
  tearDown(() => repo.dispose());

  test('starts as unknown (splash)', () {
    expect(SessionBloc(repo).state, const SessionUnknown());
  });

  blocTest<SessionBloc, SessionState>(
    'follows login and logout from the repository',
    build: () => SessionBloc(repo),
    act: (bloc) async {
      bloc.add(const SessionStarted());
      await Future<void>.delayed(Duration.zero);
      repo.userController.add(null);
      repo.userController.add(testUser);
      repo.userController.add(null);
    },
    expect: () => const [
      Unauthenticated(),
      Authenticated(testUser),
      Unauthenticated(),
    ],
  );

  blocTest<SessionBloc, SessionState>(
    'treats a stream error as logged out',
    build: () => SessionBloc(repo),
    act: (bloc) async {
      bloc.add(const SessionStarted());
      await Future<void>.delayed(Duration.zero);
      repo.userController.addError(Exception('boom'));
    },
    expect: () => const [Unauthenticated()],
  );

  blocTest<SessionBloc, SessionState>(
    'sign out calls the repository',
    build: () => SessionBloc(repo),
    act: (bloc) => bloc.add(const SignOutRequested()),
    verify: (_) => expect(repo.calls, ['signOut']),
  );
}
