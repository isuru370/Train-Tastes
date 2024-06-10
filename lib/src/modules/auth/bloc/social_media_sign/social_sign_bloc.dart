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
          (loggedInUser) async {
            if (loggedInUser.isNotEmpty) {
              await userRepository.setUser(loggedInUser).then(
                (checkNewUser) {
                  try {
                    emit(AuthSignSuccess(firstLoginUser: checkNewUser));
                  } on FirebaseAuthException catch (e) {
                    emit(AuthSignFailure(failureMassage: e.toString()));
                  } catch (e) {
                    emit(AuthSignFailure(failureMassage: e.toString()));
                  }
                },
              );
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
          (loggedInUser) async {
            if (loggedInUser.isNotEmpty) {
              await userRepository.setUser(loggedInUser).then(
                (checkNewUser) {
                  try {
                    emit(AuthSignSuccess(firstLoginUser: checkNewUser));
                  } on FirebaseAuthException catch (e) {
                    emit(AuthSignFailure(failureMassage: e.toString()));
                  } catch (e) {
                    emit(AuthSignFailure(failureMassage: e.toString()));
                  }
                },
              );
            }
          },
        );
      } on FirebaseException catch (e) {
        emit(AuthSignFailure(failureMassage: e.toString()));
      } catch (e) {
        emit(AuthSignFailure(failureMassage: e.toString()));
      }
    });
  }
}
