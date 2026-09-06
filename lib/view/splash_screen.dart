import 'dart:async';
import 'package:flutter/material.dart';
import 'package:farah/view/mainScreen.dart';

/// Splash screen — cream page background, a dark-navy welcome message
/// and decorative flourish, and a large "FZ" monogram rendered in a
/// shimmering gold gradient. Auto-counts down for 4 seconds and then
/// opens the invitation; tapping the logo opens it immediately too.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const cream = Color(0xFFF3EDE2);
  static const navy = Color(0xFF1B2A4A);
  static const gold = Color(0xFFD4AF37);
  static const goldLight = Color(0xFFF7E7A0);
  static const goldDeep = Color(0xFFB8860B);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _shineController;

  static const int _startSeconds = 4;
  Timer? _countdownTimer;
  bool _navigated = false;

  @override
  void initState() {
    super.initState();
    _shineController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();

    _countdownTimer = Timer(
      const Duration(seconds: _startSeconds),
      _openInvite,
    );
  }

  @override
  void dispose() {
    _shineController.dispose();
    _countdownTimer?.cancel();
    super.dispose();
  }

  void _openInvite() {
    if (_navigated) return;
    _navigated = true;
    _countdownTimer?.cancel();
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 600),
        pageBuilder: (context, animation, secondaryAnimation) =>
        const MainScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final fade =
          CurvedAnimation(parent: animation, curve: Curves.easeOut);
          final scale = Tween<double>(begin: 0.92, end: 1.0).animate(fade);
          return FadeTransition(
            opacity: fade,
            child: ScaleTransition(scale: scale, child: child),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SplashScreen.cream,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // welcome message
              const Text(
                'WELCOME',
                style: TextStyle(
                  fontFamily: 'LibertinusMath',
                  fontSize: 33,
                  letterSpacing: 6,
                  color: SplashScreen.navy,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'To FARAH ZONE ',
                style: TextStyle(
                  fontFamily: 'LibertinusMath',
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: SplashScreen.navy.withOpacity(0.75),
                ),
              ),

              const SizedBox(height: 56),

              // logo + flourish, boxed together so the circle always
              // wraps the FZ text regardless of screen size
              SizedBox(
                width: 280,
                height: 280,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const Positioned.fill(
                      child: CustomPaint(painter: _CircleShinePainter()),
                    ),
                    AnimatedBuilder(
                      animation: _shineController,
                      builder: (context, child) {
                        return ShaderMask(
                          blendMode: BlendMode.srcIn,
                          shaderCallback: (bounds) {
                            return LinearGradient(
                              colors: const [
                                SplashScreen.goldDeep,
                                SplashScreen.gold,
                                SplashScreen.goldLight,
                                SplashScreen.gold,
                                SplashScreen.goldDeep,
                              ],
                              stops: const [0.0, 0.35, 0.5, 0.65, 1.0],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              transform: _SlidingGradientTransform(
                                slidePercent: _shineController.value,
                              ),
                            ).createShader(bounds);
                          },
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'F',
                                style: TextStyle(
                                  fontFamily: 'LibertinusMath',
                                  fontSize: 106,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white, // masked by the shader
                                  height: 1,
                                ),
                              ),
                              Text(
                                'Z',
                                style: TextStyle(
                                  fontFamily: 'LibertinusMath',
                                  fontSize: 96,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white, // masked by the shader
                                  height: 1,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // loading indicator (no tap — auto-opens after the countdown)
              SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    SplashScreen.gold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


/// Slides the gold gradient horizontally over time to create a
/// moving "shine" highlight across the FZ text.
class _SlidingGradientTransform extends GradientTransform {
  final double slidePercent;
  const _SlidingGradientTransform({required this.slidePercent});

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    final dx = (slidePercent * 2 - 1) * bounds.width;
    return Matrix4.translationValues(dx, 0.0, 0.0);
  }
}


class _CircleShinePainter extends CustomPainter {
  const _CircleShinePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    // Main thin gold circle
    final circlePaint = Paint()
      ..color = SplashScreen.gold.withOpacity(0.75)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final radius = size.width * 0.40;

    canvas.drawCircle(
      center,
      radius,
      circlePaint,
    );

    // Soft shine highlight on the circle
    final shinePaint = Paint()
      ..color = SplashScreen.goldLight.withOpacity(0.9)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..maskFilter = const MaskFilter.blur(
        BlurStyle.normal,
        3,
      );

    canvas.drawArc(
      Rect.fromCircle(
        center: center,
        radius: radius,
      ),
      -0.8,
      1.2,
      false,
      shinePaint,
    );

    // Small sparkle
    final sparklePaint = Paint()
      ..color = SplashScreen.gold
      ..style = PaintingStyle.fill;

    _drawSparkle(
      canvas,
      Offset(
        size.width * 0.78,
        size.height * 0.20,
      ),
      6,
      sparklePaint,
    );
  }

  void _drawSparkle(
      Canvas canvas,
      Offset center,
      double size,
      Paint paint,
      ) {
    final path = Path()
      ..moveTo(center.dx, center.dy - size)
      ..lineTo(
        center.dx + size * 0.25,
        center.dy - size * 0.25,
      )
      ..lineTo(center.dx + size, center.dy)
      ..lineTo(
        center.dx + size * 0.25,
        center.dy + size * 0.25,
      )
      ..lineTo(center.dx, center.dy + size)
      ..lineTo(
        center.dx - size * 0.25,
        center.dy + size * 0.25,
      )
      ..lineTo(center.dx - size, center.dy)
      ..lineTo(
        center.dx - size * 0.25,
        center.dy - size * 0.25,
      )
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

