import 'dart:math';

import 'package:flutter/material.dart';
import 'package:masterchief_cv/main.dart';
import 'package:masterchief_cv/widgets/project_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Hero Header Section
          const SliverToBoxAdapter(child: _HeroHeader()),

          const SliverToBoxAdapter(child: SizedBox(height: 40)),

          // Engineering & Innovation Section
          SliverToBoxAdapter(
            child: ProjectSection(
              title: 'Engineering & Innovation',
              subtitle: 'Research & Development',
              icon: Icons.science,
              gradientColors: const [Color(0xFF667EEA), Color(0xFF764BA2)],
              projects: const [
                ProjectItem(
                  title: 'AI-Powered Code Assistant',
                  description:
                      'Developed an ML model that suggests code optimizations and catches bugs in real-time.',
                  technologies: ['TensorFlow', 'Python', 'Flask'],
                  icon: Icons.auto_awesome,
                ),
                ProjectItem(
                  title: 'IoT Smart Home Hub',
                  description:
                      'Created a centralized platform controlling 50+ smart devices with predictive automation.',
                  technologies: ['Raspberry Pi', 'MQTT', 'Flutter'],
                  icon: Icons.home,
                ),
              ],
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 40)),

          // Interactive Entertainment Section
          SliverToBoxAdapter(
            child: ProjectSection(
              title: 'Interactive Entertainment',
              subtitle: 'Game Development',
              icon: Icons.games,
              gradientColors: const [Color(0xFFF093FB), Color(0xFFF5576C)],
              projects: const [
                ProjectItem(
                  title: 'Space Explorer RPG',
                  description:
                      'A procedurally generated space exploration game with 50K+ downloads on itch.io.',
                  technologies: ['Unity', 'C#', 'Blender'],
                  icon: Icons.explore,
                ),
                ProjectItem(
                  title: 'Puzzle Platformer',
                  description:
                      'Award-winning puzzle game featured in Indie Game Festival 2024.',
                  technologies: ['Godot', 'GDScript', 'Aseprite'],
                  icon: Icons.gamepad,
                ),
                ProjectItem(
                  title: 'Arcade Racing Game',
                  description:
                      'Fast-paced racing game with multiplayer support.',
                  technologies: ['Unreal', 'C++', 'Blueprint'],
                  icon: Icons.speed,
                ),
              ],
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 40)),

          // Digital Products Section
          SliverToBoxAdapter(
            child: ProjectSection(
              title: 'Digital Products',
              subtitle: 'Web & App Development',
              icon: Icons.apps,
              gradientColors: const [Color(0xFF4FACFE), Color(0xFF00F2FE)],
              projects: const [
                ProjectItem(
                  title: 'E-Commerce Platform',
                  description:
                      'Full-stack marketplace with 10K+ monthly users.',
                  technologies: ['Flutter', 'Firebase', 'Stripe'],
                  icon: Icons.shopping_cart,
                ),
                ProjectItem(
                  title: 'Task Management Suite',
                  description: 'Productivity app used by 500+ teams worldwide.',
                  technologies: ['React', 'Node.js', 'MongoDB'],
                  icon: Icons.task,
                ),
                ProjectItem(
                  title: 'Social Media Dashboard',
                  description: 'Analytics platform for content creators.',
                  technologies: ['Flutter', 'Supabase', 'Chart.js'],
                  icon: Icons.dashboard,
                ),
              ],
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 40)),

          // Social Impact Section
          SliverToBoxAdapter(
            child: ProjectSection(
              title: 'Social Impact',
              subtitle: 'Community Work & Non-Profit',
              icon: Icons.favorite,
              gradientColors: const [Color(0xFFFA709A), Color(0xFFFEE140)],
              projects: const [
                ProjectItem(
                  title: 'Pawsitive Connect',
                  description:
                      'A platform connecting animal shelters with adopters, featuring 200+ successful adoptions.',
                  technologies: ['Flutter', 'Firebase', 'Google Maps API'],
                  icon: Icons.pets,
                ),
                ProjectItem(
                  title: 'Code for Good Initiative',
                  description:
                      'Mentored 50+ aspiring developers through free coding workshops in underserved communities.',
                  technologies: [
                    'Teaching',
                    'Curriculum Design',
                    'Open Source',
                  ],
                  icon: Icons.school,
                ),
                ProjectItem(
                  title: 'Food Rescue App',
                  description:
                      'Connecting restaurants with food banks to reduce waste.',
                  technologies: ['React Native', 'Node.js', 'Twilio'],
                  icon: Icons.restaurant,
                ),
              ],
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 40)),

          // Footer
          const SliverToBoxAdapter(child: _Footer()),

          const SliverToBoxAdapter(child: SizedBox(height: 40)),
        ],
      ),
    );
  }
}

// Hero Header Widget (separate for cleanliness)
class _HeroHeader extends StatelessWidget {
  const _HeroHeader();

  @override
  Widget build(BuildContext context) {
    return const AnimatedOrbitWidget();
  }
}

class AnimatedOrbitWidget extends StatefulWidget {
  const AnimatedOrbitWidget({super.key});

  @override
  State<StatefulWidget> createState() => _AnimatedOrbitWidgetState();
}

class _AnimatedOrbitWidgetState extends State<AnimatedOrbitWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(days: 1),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blue.shade900,
            Colors.purple.shade800,
            Colors.deepPurple.shade900,
          ],
        ),
      ),
      child: Stack(
        children: [
          // Animated background circles
          Positioned(
            right: -50,
            top: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.opaque(0.05),
              ),
            ),
          ),
          Positioned(
            left: -30,
            bottom: -30,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.opaque(0.05),
              ),
            ),
          ),

          ..._buildOrbitingPlanets(),
          // Center Star
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: 'avatar',
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.yellow.shade300,
                        width: 4,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.orange.opaque(0.5),
                          blurRadius: 30,
                          spreadRadius: 10,
                        ),
                      ],
                      gradient: RadialGradient(
                        colors: [
                          Colors.yellow.shade300,
                          Colors.orange.shade700,
                          Colors.red.shade900,
                        ],
                        stops: const [0.3, 0.7, 1.0],
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.transparent,
                      // child: Icon(Icons.star, size: 50, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'MasterChief',
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.5,
                    shadows: [
                      Shadow(
                        blurRadius: 10,
                        color: Colors.orange,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.opaque(0.2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text(
                    'Creative Technologist & Full-Stack Developer',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildOrbitingPlanets() {
    final planets = [
      PlanetData(
        radius: 130,
        size: 20,
        color: Colors.red.shade400,
        speed: 8000,
        name: 'Mars',
      ),
      PlanetData(
        radius: 160,
        size: 28,
        color: Colors.red.shade400,
        speed: 6000,
        name: 'Earth',
      ),
      PlanetData(
        radius: 200,
        size: 35,
        color: Colors.red.shade400,
        speed: 4000,
        name: 'Jupiter',
      ),
      PlanetData(
        radius: 240,
        size: 24,
        color: Colors.red.shade400,
        speed: 3000,
        name: 'Neptune',
      ),
    ];

    return planets.asMap().entries.map((entry) {
      final index = entry.key;
      final planet = entry.value;

      return AnimatedBuilder(
        animation: _controller,
        builder: ((context, child) {
          // Calculate angle - now using speed multiplier
          // _controller.value goes from 0 to 1 over 365 days
          // Multiply by 2π and speed to get reasonable orbit rates
          final angle =
              (_controller.value * 2 * pi * planet.speed) + (index * pi / 2);
          final x = cos(angle) * planet.radius;
          final y = sin(angle) * planet.radius;

          return Positioned(
            left: MediaQuery.of(context).size.width / 2 + x - planet.size / 2,
            top: 250 + y - planet.size / 2,
            child: Container(
              width: planet.size,
              height: planet.size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: planet.color,
                boxShadow: [
                  BoxShadow(
                    color: planet.color.opaque(0.5),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  planet.name[0],
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          );
        }),
      );
    }).toList();
  }
}

class PlanetData {
  final double radius;
  final double size;
  final Color color;
  final double speed;
  final String name;

  PlanetData({
    required this.radius,
    required this.size,
    required this.color,
    required this.speed,
    required this.name,
  });
}

// Footer Widget
class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.blue.shade900, Colors.purple.shade900],
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          const Text(
            "Let's Build Something Amazing Together",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          const Text(
            'Open for collaborations, freelance work, and innovative projects',
            style: TextStyle(color: Colors.white70, fontSize: 14),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 12,
            alignment: WrapAlignment.center,
            children: [
              _buildContactChip(Icons.email, 'bgamer9999.b9@gmail.com'),
              _buildContactChip(Icons.phone, '+39 348 893 6829'),
              _buildContactChip(Icons.location_on, 'Nuvolera, BS'),
              _buildContactChip(Icons.code, 'github.com/M4st3rChief-S117'),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialCircle(Icons.android),
              const SizedBox(width: 12),
              _buildSocialCircle(Icons.link),
              const SizedBox(width: 12),
              _buildSocialCircle(Icons.alternate_email),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactChip(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.opaque(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: Colors.white),
          const SizedBox(width: 6),
          Text(text, style: const TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildSocialCircle(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.opaque(0.2),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white, size: 20),
    );
  }
}
