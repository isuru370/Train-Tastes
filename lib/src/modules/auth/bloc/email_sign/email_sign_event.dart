part of 'email_sign_bloc.dart';

sealed class EmailSignEvent extends Equatable {
  const EmailSignEvent();

  @override
  List<Object> get props => [];
}

class EmailSignInEvent extends EmailSignEvent {
  final String email;
  final String password;

  const EmailSignInEvent({required this.email, required this.password});
}

class EmailSignOutEvent extends EmailSignEvent {
  const EmailSignOutEvent();
}
