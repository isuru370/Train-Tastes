import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/user_repository.dart';

part 'social_sign_event.dart';
part 'social_sign_state.dart';

class SocialSignBloc extends Bloc<SocialSignEvent, SocialSignState> {
  SocialSignBloc() : super(AuthSignInitial()) {
    UserRepository userRepository = FirebaseUserRepository();
    on<FacebookSignRequest>((event, emit) async {
      emit(AuthSignProcess());
      try {
        await userRepository.signInUpFacebook().then(
          (value) {
            if (value) {
              emit(AuthSignProcess());
            } else {
              emit(const AuthSignFailure(
                  failureMassage: "facebook login failed"));
            }
          },
        );
      } on FirebaseException catch (e) {
        emit(AuthSignFailure(failureMassage: e.toString()));
      } catch (e) {
        emit(AuthSignFailure(failureMassage: e.toString()));
      }
      emit(const AuthSignFailure());
    });

    on<GoogleSignRequest>((event, emit) async {
      emit(AuthSignProcess());
      try {
        await userRepository.signInUpGoogle().then(
          (value) {
            if (value) {
              emit(AuthSignProcess());
            } else {
              emit(const AuthSignFailure(
                  failureMassage: "facebook login failed"));
            }
          },
        );
      } on FirebaseException catch (e) {
        emit(AuthSignFailure(failureMassage: e.toString()));
      } catch (e) {
        emit(AuthSignFailure(failureMassage: e.toString()));
      }
      emit(const AuthSignFailure());
    });
  }
}
