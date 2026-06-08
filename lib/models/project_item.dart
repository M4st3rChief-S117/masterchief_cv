import 'package:flutter/material.dart';

class ProjectItem {
  final String title;
  final String description;
  final List<String> technologies;
  final IconData icon;
  final String? imageUrl;

  const ProjectItem({
    required this.title,
    required this.description,
    required this.technologies,
    required this.icon,
    this.imageUrl,
  });
}
