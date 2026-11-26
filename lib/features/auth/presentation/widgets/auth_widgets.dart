import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/fade_slide_in.dart';
import '../cubit/auth_form_cubit.dart';

/// Logo + title at the top of each auth page.
class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return FadeSlideIn(
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          isDark ? 'assets/images/logo/logo_white.png' : 'assets/images/logo/logo_black.png',
          height: 56,
          errorBuilder: (_, __, ___) => const SizedBox(height: 56),
        ),
        const SizedBox(height: 28),
        Text(title, style: text.headlineMedium?.copyWith(fontWeight: FontWeight.w700)),
        const SizedBox(height: 6),
        Text(subtitle, style: text.bodyMedium?.copyWith(color: Theme.of(context).hintColor)),
        const SizedBox(height: 28),
      ],
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  const PasswordField({super.key, required this.controller, this.validator, this.label = 'Password'});
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String label;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _hidden = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _hidden,
      validator: widget.validator,
      autofillHints: const [AutofillHints.password],
      decoration: InputDecoration(
        labelText: widget.label,
        prefixIcon: const Icon(Icons.lock_outline),
        suffixIcon: IconButton(
          icon: Icon(_hidden ? Icons.visibility_outlined : Icons.visibility_off_outlined),
          onPressed: () => setState(() => _hidden = !_hidden),
        ),
      ),
    );
  }
}

/// Filled button that shows a spinner while the form is loading.
class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key, required this.label, required this.onPressed});
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final loading = context.select((AuthFormCubit c) => c.state.isLoading);
    return FilledButton(
      onPressed: loading ? null : onPressed,
      child: loading
          ? const SizedBox(width: 22, height: 22, child: CircularProgressIndicator(strokeWidth: 2.5))
          : Text(label),
    );
  }
}

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final loading = context.select((AuthFormCubit c) => c.state.isLoading);
    return OutlinedButton.icon(
      onPressed: loading ? null : () => context.read<AuthFormCubit>().signInWithGoogle(),
      icon: Image.asset(
        'assets/images/logo/google.png',
        height: 22,
        errorBuilder: (_, __, ___) => const Icon(Icons.g_mobiledata, size: 28),
      ),
      label: const Text('Continue with Google'),
    );
  }
}

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(children: [
        Expanded(child: Divider()),
        Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Text('or')),
        Expanded(child: Divider()),
      ]),
    );
  }
}

/// Shows errors (and success messages) from [AuthFormCubit] as a SnackBar.
class AuthFormListener extends StatelessWidget {
  const AuthFormListener({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthFormCubit, AuthFormState>(
      listenWhen: (_, s) => s.message != null,
      listener: (context, state) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(state.message!)));
      },
      child: child,
    );
  }
}
