import 'package:flutter/material.dart';
import 'package:masterchief_cv/models/project_detail.dart';
import 'package:masterchief_cv/widgets/section_header.dart';
import 'package:masterchief_cv/widgets/work_card.dart';

class ProjectSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final List<Color> gradientColors;
  final List<ProjectDetail> projects;

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
            height: 400,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final availableWidth = constraints.maxWidth;
                final spacing = 20.0;
                const minCardWidth = 350.0;
                const maxCardWidth = 700.0;

                final maxCardsThatFit =
                    ((availableWidth + spacing) / (minCardWidth + spacing))
                        .floor();
                final visibleCards = projects.length < maxCardsThatFit
                    ? projects.length
                    : maxCardsThatFit;

                final cardWidth =
                    (availableWidth - (spacing * (visibleCards - 1))) /
                    visibleCards;

                final clampedWidth = cardWidth.clamp(
                  minCardWidth,
                  maxCardWidth,
                );

                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: projects.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 20),
                  itemBuilder: (context, index) {
                    final project = projects[index];

                    return SizedBox(
                      width: clampedWidth,
                      child: WorkCard(
                        title: project.title,
                        description: project.description,
                        technologies: project.technologies,
                        icon: project.icon,
                        gradientColors: gradientColors,
                        imageUrl: project.imageUrl,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
