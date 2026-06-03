import 'package:flutter/material.dart';

void main() {
  runApp(const MyCVApp());
}

class MyCVApp extends StatelessWidget {
  const MyCVApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MasterChief - CV',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const CVPage(),
    );
  }
}

class CVPage extends StatelessWidget {
  const CVPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: CustomScrollView(
        slivers: [
          // App Bar with gradient
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'Master Chief',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.blue.shade800, Colors.purple.shade600],
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, size: 60, color: Colors.blue),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Software Developer',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Main content
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // About Section
                _buildSection(
                  title: 'About Me',
                  icon: Icons.person_outline,
                  child: Text(
                    'Passionate Flutter developer with expertise in building beautiful cross-platform applications. '
                    'Experienced in web, mobile, and desktop development with a focus on clean code and great user experiences.',
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                ),

                const SizedBox(height: 24),

                // Experience Section
                _buildSection(
                  title: 'Experience',
                  icon: Icons.work_outline,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildExperienceItem(
                        title: 'Senior Flutter Developer',
                        company: 'Tech Corp',
                        period: '2022 - Present',
                        description:
                            'Leading mobile app development team, building scalable Flutter applications for enterprise clients.',
                      ),
                      const SizedBox(height: 16),
                      _buildExperienceItem(
                        title: 'Mobile Developer',
                        company: 'StartUp Inc',
                        period: '2020 - 2022',
                        description:
                            'Developed and maintained multiple Flutter apps for iOS, Android, and web platforms.',
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Skills Section
                _buildSection(
                  title: 'Skills',
                  icon: Icons.code,
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _buildSkillChip('Flutter'),
                      _buildSkillChip('Dart'),
                      _buildSkillChip('Firebase'),
                      _buildSkillChip('REST API'),
                      _buildSkillChip('Git'),
                      _buildSkillChip('UI/UX Design'),
                      _buildSkillChip('SQL'),
                      _buildSkillChip('JavaScript'),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Contact Section
                _buildSection(
                  title: 'Contact',
                  icon: Icons.contact_mail,
                  child: Column(
                    children: [
                      _buildContactItem(Icons.email, 'masterchief@example.com'),
                      const SizedBox(height: 12),
                      _buildContactItem(Icons.phone, '+1 (555) 123-4567'),
                      const SizedBox(height: 12),
                      _buildContactItem(Icons.location_on, 'San Francisco, CA'),
                    ],
                  ),
                ),

                const SizedBox(height: 32),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 28, color: Colors.blue.shade700),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }

  Widget _buildExperienceItem({
    required String title,
    required String company,
    required String period,
    required String description,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          company,
          style: TextStyle(
            fontSize: 14,
            color: Colors.blue.shade700,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          period,
          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
        ),
        const SizedBox(height: 8),
        Text(description, style: const TextStyle(height: 1.4)),
      ],
    );
  }

  Widget _buildSkillChip(String skill) {
    return Chip(
      label: Text(skill),
      backgroundColor: Colors.blue.shade50,
      side: BorderSide(color: Colors.blue.shade200),
      labelStyle: TextStyle(color: Colors.blue.shade800),
    );
  }

  Widget _buildContactItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey.shade600),
        const SizedBox(width: 12),
        Text(text, style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}
