import 'package:flutter/material.dart';
import 'package:masterchief_cv/widgets/section_header.dart';
import 'package:masterchief_cv/widgets/work_card.dart';

class ProjectSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final List<Color> gradientColors;
  final List<ProjectItem> projects;

  const ProjectSection({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.gradientColors,
    required this.projects,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            title: title,
            subtitle: subtitle,
            icon: icon,
            gradientColors: gradientColors,
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 220,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: projects.length,
              separatorBuilder: (context, index) => const SizedBox(width: 16),
              itemBuilder: (context, index) {
                final project = projects[index];
                return SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: WorkCard(
                    title: project.title,
                    description: project.description,
                    technologies: project.technologies,
                    icon: project.icon,
                    gradientColors: gradientColors,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectItem {
  final String title;
  final String description;
  final List<String> technologies;
  final IconData icon;

  const ProjectItem({
    required this.title,
    required this.description,
    required this.technologies,
    required this.icon,
  });
}
