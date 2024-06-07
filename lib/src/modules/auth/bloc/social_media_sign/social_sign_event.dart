part of 'social_sign_bloc.dart';

sealed class SocialSignEvent extends Equatable {
  const SocialSignEvent();

  @override
  List<Object> get props => [];
}

class FacebookSignRequest extends SocialSignEvent {}

class GoogleSignRequest extends SocialSignEvent {}
