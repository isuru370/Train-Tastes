part of 'email_sign_bloc.dart';

sealed class EmailSignState extends Equatable {
  const EmailSignState();

  @override
  List<Object> get props => [];
}

final class EmailSignInitial extends EmailSignState {}

class EmailSignInSuccess extends EmailSignState {}

class EmailSignInFailure extends EmailSignState {
  final String? massage;

  const EmailSignInFailure({this.massage});
}

class EmailSignInProcess extends EmailSignState {}

class EmailSignOutProcess extends EmailSignState {}
