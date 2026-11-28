import 'dart:async';

import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/presentation/bloc/session_bloc.dart';
import '../features/auth/presentation/pages/forgot_password_page.dart';
import '../features/auth/presentation/pages/sign_in_page.dart';
import '../features/auth/presentation/pages/sign_up_page.dart';
import '../features/auth/presentation/pages/splash_page.dart';
import '../features/home/presentation/pages/home_page.dart';
import '../features/landing/presentation/pages/landing_page.dart';

class Routes {
  Routes._();
  static const splash = '/';
  static const landing = '/welcome';
  static const signIn = '/sign-in';
  static const signUp = '/sign-up';
  static const forgotPassword = '/forgot-password';
  static const home = '/home';
}

const _authPages = {Routes.landing, Routes.signIn, Routes.signUp, Routes.forgotPassword};

/// The router watches the session. Logged out → landing page.
/// Logged in → home. Screens never navigate after login themselves.
GoRouter createRouter(SessionBloc session) {
  return GoRouter(
    initialLocation: Routes.splash,
    refreshListenable: _StreamListenable(session.stream),
    redirect: (context, state) {
      final location = state.matchedLocation;
      return switch (session.state) {
        SessionUnknown() => location == Routes.splash ? null : Routes.splash,
        Unauthenticated() =>
          _authPages.contains(location) ? null : Routes.landing,
        Authenticated() =>
          (location == Routes.splash || _authPages.contains(location))
              ? Routes.home
              : null,
      };
    },
    routes: [
      GoRoute(path: Routes.splash, builder: (_, __) => const SplashPage()),
      GoRoute(
        path: Routes.landing,
        pageBuilder: (_, state) => _fade(state, const LandingPage()),
      ),
      GoRoute(
        path: Routes.signIn,
        pageBuilder: (_, state) => _slide(state, const SignInPage()),
      ),
      GoRoute(
        path: Routes.signUp,
        pageBuilder: (_, state) => _slide(state, const SignUpPage()),
      ),
      GoRoute(
        path: Routes.forgotPassword,
        pageBuilder: (_, state) => _slide(state, const ForgotPasswordPage()),
      ),
      GoRoute(
        path: Routes.home,
        pageBuilder: (_, state) => _fade(state, const HomePage()),
      ),
    ],
  );
}

class _StreamListenable extends ChangeNotifier {
  _StreamListenable(Stream<dynamic> stream) {
    _sub = stream.listen((_) => notifyListeners());
  }
  late final StreamSubscription<dynamic> _sub;

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }
}

// ---------- Page transitions ----------
CustomTransitionPage<void> _fade(GoRouterState state, Widget child) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 500),
    transitionsBuilder: (_, animation, __, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}

CustomTransitionPage<void> _slide(GoRouterState state, Widget child) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 350),
    transitionsBuilder: (_, animation, __, child) {
      final curved = CurvedAnimation(parent: animation, curve: Curves.easeOutCubic);
      return FadeTransition(
        opacity: curved,
        child: SlideTransition(
          position: Tween(begin: const Offset(0.08, 0), end: Offset.zero).animate(curved),
          child: child,
        ),
      );
    },
  );
}
