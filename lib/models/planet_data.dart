import 'package:flutter/material.dart';

class PlanetData {
  final double radiusX; // Horizontal radius (controls left/right distance)
  final double radiusY; // Vertical radius (controls top/bottom distance)
  final double size;
  final Color color;
  final double speed;
  final String name;
  final IconData icon;

  PlanetData({
    required this.radiusX,
    required this.radiusY,
    required this.size,
    required this.color,
    required this.speed,
    required this.name,
    required this.icon,
  });
}
