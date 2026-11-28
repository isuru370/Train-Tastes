import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failure.dart';
import '../../domain/repositories/auth_repository.dart';

enum FormStatus { idle, loading, success, failure }

class AuthFormState extends Equatable {
  const AuthFormState({this.status = FormStatus.idle, this.message});
  final FormStatus status;
  final String? message;

  bool get isLoading => status == FormStatus.loading;

  @override
  List<Object?> get props => [status, message];
}

/// Handles the buttons on the sign in, sign up and forgot password pages.
/// After a successful sign in, the SessionBloc + router move to home.
class AuthFormCubit extends Cubit<AuthFormState> {
  AuthFormCubit(this._repo) : super(const AuthFormState());
  final AuthRepository _repo;

  Future<void> signIn(String email, String password) =>
      _run(() => _repo.signInWithEmail(email: email, password: password));

  Future<void> signUp(String name, String email, String password) => _run(
        () => _repo.signUpWithEmail(name: name, email: email, password: password),
      );

  Future<void> signInWithGoogle() => _run(_repo.signInWithGoogle);

  Future<void> sendPasswordReset(String email) => _run(
        () => _repo.sendPasswordReset(email),
        successMessage: 'Reset link sent. Check your email.',
      );

  Future<void> _run(Future<void> Function() action, {String? successMessage}) async {
    if (state.isLoading) return;
    emit(const AuthFormState(status: FormStatus.loading));
    try {
      await action();
      emit(AuthFormState(status: FormStatus.success, message: successMessage));
    } on SignInCancelled {
      emit(const AuthFormState());
    } on Failure catch (f) {
      emit(AuthFormState(status: FormStatus.failure, message: f.message));
    }
  }
}
