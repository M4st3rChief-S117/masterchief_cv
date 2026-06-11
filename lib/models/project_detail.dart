import 'package:flutter/material.dart';

class ProjectDetail {
  final String title;
  final String description;
  final IconData icon;
  final List<String> technologies;
  final String imageUrl;
  final Color color;

  ProjectDetail({
    required this.title,
    required this.description,
    required this.icon,
    required this.technologies,
    required this.imageUrl,
    required this.color,
  });
}
