import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/presentation/bloc/session_bloc.dart';

/// One place where every dependency is created.
/// Screens and blocs never call `FirebaseAuth.instance` themselves,
/// which keeps them easy to test and easy to swap later.
final sl = GetIt.instance;

Future<void> configureDependencies() async {
  // External
  final googleSignIn = GoogleSignIn.instance;
  // On Android, if you get "serverClientId must be provided",
  // pass the Web client ID from Firebase console here:
  // await googleSignIn.initialize(serverClientId: 'xxxx.apps.googleusercontent.com');
  await googleSignIn.initialize();

  sl
    ..registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance)
    ..registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance)
    ..registerLazySingleton<GoogleSignIn>(() => googleSignIn)

    // Data
    ..registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSource(
        auth: sl(),
        firestore: sl(),
        googleSignIn: sl(),
      ),
    )
    ..registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()))

    // App-wide session (who is logged in right now)
    ..registerLazySingleton<SessionBloc>(() => SessionBloc(sl()));
}
