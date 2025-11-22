import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final IconData icon;
  final Color color;
  final String? badge;
  final String? iconImage;
  final bool useReact; // Flag untuk menggunakan React WebView
  final String? reactUrl; // URL React app jika useReact = true

  MenuItem({
    required this.title,
    required this.icon,
    required this.color,
    this.badge,
    this.iconImage,
    this.useReact = false,
    this.reactUrl,
  });
}
