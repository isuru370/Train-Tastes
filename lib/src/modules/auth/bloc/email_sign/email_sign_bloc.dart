import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/user_repository.dart';

part 'email_sign_event.dart';
part 'email_sign_state.dart';

class EmailSignBloc extends Bloc<EmailSignEvent, EmailSignState> {
  EmailSignBloc() : super(EmailSignInitial()) {
    UserRepository userRepository = FirebaseUserRepository();
    on<EmailSignInEvent>((event, emit) async {
      emit(EmailSignInProcess());
      try {
        await userRepository.signInEmail(event.email, event.password);
        emit(EmailSignInSuccess());
      } on FirebaseAuthException catch (e) {
        emit(EmailSignInFailure(massage: e.code));
      } catch (e) {
        emit(const EmailSignInFailure());
      }
    });

    on<EmailSignOutEvent>((event, emit) async {
      emit(EmailSignOutProcess());
      await userRepository.logOut();
    });
  }
}
