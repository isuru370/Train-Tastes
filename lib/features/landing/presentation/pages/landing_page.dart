import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/fade_slide_in.dart';

/// First screen a logged-out person sees.
/// The train rolls in on a moving track, then the text and buttons appear.
class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> with TickerProviderStateMixin {
  // Train rolls in once.
  late final AnimationController _arrive = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1400),
  )..forward();

  // Track sleepers and the little bounce keep looping.
  late final AnimationController _loop = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 900),
  )..repeat();

  @override
  void dispose() {
    _arrive.dispose();
    _loop.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              SizedBox(
                height: size.height * 0.30,
                child: _TrainScene(arrive: _arrive, loop: _loop),
              ),
              const SizedBox(height: 32),
              const FadeSlideIn(
                delay: Duration(milliseconds: 900),
                child: Text(
                  'Train Tastes',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const FadeSlideIn(
                delay: Duration(milliseconds: 1050),
                child: Text(
                  'Breakfast ready at your station,\nbefore your train arrives.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70, fontSize: 15, height: 1.5),
                ),
              ),
              const SizedBox(height: 28),
              const _Step(
                delay: Duration(milliseconds: 1250),
                icon: Icons.nightlight_round,
                text: 'Order tonight, 6 PM – 12 AM',
              ),
              const _Step(
                delay: Duration(milliseconds: 1400),
                icon: Icons.storefront_outlined,
                text: 'Local shops prepare it fresh',
              ),
              const _Step(
                delay: Duration(milliseconds: 1550),
                icon: Icons.train_outlined,
                text: 'Pick it up at your station',
              ),
              const Spacer(),
              FadeSlideIn(
                delay: const Duration(milliseconds: 1750),
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.accent,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () => context.push(Routes.signUp),
                  child: const Text('Get started'),
                ),
              ),
              const SizedBox(height: 12),
              FadeSlideIn(
                delay: const Duration(milliseconds: 1850),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.white38),
                  ),
                  onPressed: () => context.push(Routes.signIn),
                  child: const Text('I already have an account'),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _Step extends StatelessWidget {
  const _Step({required this.delay, required this.icon, required this.text});
  final Duration delay;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return FadeSlideIn(
      delay: delay,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.accent, size: 20),
            const SizedBox(width: 10),
            Text(text, style: const TextStyle(color: Colors.white, fontSize: 14)),
          ],
        ),
      ),
    );
  }
}

/// The logo train rolling in on a track that keeps moving.
class _TrainScene extends StatelessWidget {
  const _TrainScene({required this.arrive, required this.loop});
  final AnimationController arrive;
  final AnimationController loop;

  @override
  Widget build(BuildContext context) {
    final roll = CurvedAnimation(parent: arrive, curve: Curves.easeOutBack);

    return LayoutBuilder(
      builder: (context, c) {
        final trainSize = c.maxHeight * 0.85;
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            // Moving track
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: 14,
              child: AnimatedBuilder(
                animation: loop,
                builder: (_, __) => CustomPaint(
                  painter: _TrackPainter(shift: loop.value),
                ),
              ),
            ),
            // Train
            AnimatedBuilder(
              animation: Listenable.merge([roll, loop]),
              builder: (_, child) {
                final startX = -(c.maxWidth / 2 + trainSize);
                final x = startX * (1 - roll.value);
                final bob = arrive.isCompleted
                    ? math.sin(loop.value * 2 * math.pi) * 2
                    : 0.0;
                return Transform.translate(
                  offset: Offset(x, -10 + bob),
                  child: child,
                );
              },
              child: Container(
                width: trainSize,
                height: trainSize,
                padding: EdgeInsets.all(trainSize * 0.08),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.accent.withValues(alpha: 0.35),
                      blurRadius: 40,
                      spreadRadius: 4,
                    ),
                  ],
                ),
                child: Image.asset('assets/images/logo/logo_icon.png'),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _TrackPainter extends CustomPainter {
  _TrackPainter({required this.shift});

  /// 0 → 1, one full sleeper gap per loop, so it repeats seamlessly.
  final double shift;

  @override
  void paint(Canvas canvas, Size size) {
    final rail = Paint()
      ..color = Colors.white38
      ..strokeWidth = 2;
    final sleeper = Paint()
      ..color = Colors.white24
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(const Offset(0, 3), Offset(size.width, 3), rail);
    canvas.drawLine(Offset(0, size.height - 3), Offset(size.width, size.height - 3), rail);

    const gap = 28.0;
    final offset = shift * gap;
    for (double x = -offset; x < size.width + gap; x += gap) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), sleeper);
    }
  }

  @override
  bool shouldRepaint(_TrackPainter old) => old.shift != shift;
}
