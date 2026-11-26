import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/app_user.dart';
import '../../domain/repositories/auth_repository.dart';

// ---------- Events ----------
sealed class SessionEvent {
  const SessionEvent();
}

final class SessionStarted extends SessionEvent {
  const SessionStarted();
}

final class SignOutRequested extends SessionEvent {
  const SignOutRequested();
}

// ---------- States ----------
sealed class SessionState extends Equatable {
  const SessionState();
  @override
  List<Object?> get props => [];
}

/// App just opened, still checking.
final class SessionUnknown extends SessionState {
  const SessionUnknown();
}

final class Unauthenticated extends SessionState {
  const Unauthenticated();
}

final class Authenticated extends SessionState {
  const Authenticated(this.user);
  final AppUser user;
  @override
  List<Object?> get props => [user];
}

// ---------- Bloc ----------
/// Knows who is logged in for the whole app. The router listens to it.
class SessionBloc extends Bloc<SessionEvent, SessionState> {
  SessionBloc(this._repo) : super(const SessionUnknown()) {
    on<SessionStarted>(_onStarted);
    on<SignOutRequested>((_, __) => _repo.signOut());
  }

  final AuthRepository _repo;

  Future<void> _onStarted(SessionStarted event, Emitter<SessionState> emit) {
    return emit.forEach<AppUser?>(
      _repo.watchUser(),
      onData: (user) =>
          user == null ? const Unauthenticated() : Authenticated(user),
      onError: (_, __) => const Unauthenticated(),
    );
  }
}
