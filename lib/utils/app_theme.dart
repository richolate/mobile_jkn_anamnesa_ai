import 'package:flutter/material.dart';

class AppTheme {
  // Colors berdasarkan gambar Mobile JKN
  static const Color primaryBlue = Color(0xFF0066CC);
  static const Color darkBlue = Color(0xFF1A237E);
  static const Color lightBlue = Color(0xFF00B8D4);
  static const Color orange = Color(0xFFFF6B35);
  static const Color pink = Color(0xFFE91E63);
  static const Color purple = Color(0xFF9C27B0);
  static const Color red = Color(0xFFFF0000);
  static const Color green = Color(0xFF4CAF50);
  static const Color yellow = Color(0xFFFFEB3B);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [darkBlue, primaryBlue, lightBlue],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient waveGradient = LinearGradient(
    colors: [
      Color(0xFFFF6B35),
      Color(0xFFE91E63),
      Color(0xFF9C27B0),
      lightBlue,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
