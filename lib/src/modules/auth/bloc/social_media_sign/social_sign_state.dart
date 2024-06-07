part of 'social_sign_bloc.dart';

sealed class SocialSignState extends Equatable {
  const SocialSignState();

  @override
  List<Object> get props => [];
}

final class AuthSignInitial extends SocialSignState {}

final class AuthSignProcess extends SocialSignState {}

final class AuthSignSuccess extends SocialSignState {}

final class AuthSignFailure extends SocialSignState {
  final String? failureMassage;
  const AuthSignFailure({this.failureMassage});
}
