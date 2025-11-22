import 'package:flutter/material.dart';
import 'dart:async';
import 'home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _animationController.forward();

    // Navigate to home screen after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1A237E), // Dark Navy Blue
              Color(0xFF0D47A1), // Blue
              Color(0xFF1976D2), // Lighter Blue
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Image.asset(
          'assets/images/onboarding.png',
          fit: BoxFit
              .cover, // Kunci agar gambar memenuhi layar (crop jika perlu)
          cacheWidth: 800,
          width: double.infinity, // Memastikan lebar mentok ke sisi layar
          height: double.infinity, // Memastikan tinggi mentok ke sisi layar
        ),
      ),
    );
  }
}

// Custom painter for wave patterns
// class WavePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()..style = PaintingStyle.fill;

//     // Orange wave
//     paint.shader = const LinearGradient(
//       colors: [Color(0xFFFF6B35), Color(0xFFFF8A65)],
//     ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

//     final orangePath = Path();
//     orangePath.moveTo(0, size.height * 0.3);
//     orangePath.quadraticBezierTo(
//       size.width * 0.25,
//       size.height * 0.25,
//       size.width * 0.5,
//       size.height * 0.3,
//     );
//     orangePath.quadraticBezierTo(
//       size.width * 0.75,
//       size.height * 0.35,
//       size.width,
//       size.height * 0.2,
//     );
//     orangePath.lineTo(size.width, size.height * 0.4);
//     orangePath.quadraticBezierTo(
//       size.width * 0.75,
//       size.height * 0.45,
//       size.width * 0.5,
//       size.height * 0.4,
//     );
//     orangePath.quadraticBezierTo(
//       size.width * 0.25,
//       size.height * 0.35,
//       0,
//       size.height * 0.4,
//     );
//     orangePath.close();
//     canvas.drawPath(orangePath, paint);

//     // Cyan wave
//     paint.shader = const LinearGradient(
//       colors: [Color(0xFF00B8D4), Color(0xFF26C6DA)],
//     ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

//     final cyanPath = Path();
//     cyanPath.moveTo(0, size.height * 0.6);
//     cyanPath.quadraticBezierTo(
//       size.width * 0.25,
//       size.height * 0.55,
//       size.width * 0.5,
//       size.height * 0.6,
//     );
//     cyanPath.quadraticBezierTo(
//       size.width * 0.75,
//       size.height * 0.65,
//       size.width,
//       size.height * 0.5,
//     );
//     cyanPath.lineTo(size.width, size.height * 0.7);
//     cyanPath.quadraticBezierTo(
//       size.width * 0.75,
//       size.height * 0.75,
//       size.width * 0.5,
//       size.height * 0.7,
//     );
//     cyanPath.quadraticBezierTo(
//       size.width * 0.25,
//       size.height * 0.65,
//       0,
//       size.height * 0.7,
//     );
//     cyanPath.close();
//     canvas.drawPath(cyanPath, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }
